//
//  AuthViewModel.swift
//  MobileApp
//
//  Created by Steffi Lin on 6/13/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


@MainActor

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User? //tells us whether user is logged in
    @Published var currentUser: User?
    
    @Published var errorMessage = ""
    
    let firestore: Firestore
    
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        self.firestore = Firestore.firestore()
        
        Task {
            await fetchUser()
        }
    }
    
    func signIn(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        } catch {
            print("DEBUG: Failed to log in with error \(error.localizedDescription)")
        }
    }
    
    func createUser(withEmail email: String, password: String, fullname: String, age: Int) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            print("here")
            self.userSession = result.user
            let user = User(id: result.user.uid, fullname: fullname, email: email, age: age)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
        
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut() //signs user out on backend
            self.userSession = nil //wipes out user session and takes us ack to login screen
            self.currentUser = nil
        } catch {
            print("DEBUG: Failed to sign out with error \(error.localizedDescription)")
        }
        
    }
    
    func deleteAccount() {
        print("delete account...")
    }
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
//        self.currentUser = try? snapshot.data(as: User.self)
//        self.currentUser = User(data: snapshot.data)
        guard let data = snapshot.data() else { return }
        self.currentUser = User(data: data)
        
        //fetch user chats
//        guard let chats = try? await Firestore.firestore().collection("users").document(uid).collection("chats").
        //self.currentUser.chats =
        self.firestore.collection("users").document(uid).collection("chats").getDocuments { (snapshot, error) in
//            if let error = error {
//                print(error)
//                return
//            }
            guard let snapshot = snapshot, error == nil else {
                //handle error
                return
            }
            print("Number of documents: \(snapshot.documents.count)")
                snapshot.documents.forEach({ (documentSnapshot) in
                  let documentData = documentSnapshot.data()
                  let quote = documentData["Quote"] as? String
                  let url = documentData["Url"] as? String
                  print("Quote: \(quote ?? "(unknown)")")
                  print("Url: \(url ?? "(unknown)")")
                })
//            querySnapshot?.documents.forEach({queryDocumentSnapshot in
//                let data = queryDocumentSnapshot.data()
//                let chat[data] = Chat(
//            })
        }
        
//        print("DEBUG: Current user is \(self.currentUser)")
    }
    
}
