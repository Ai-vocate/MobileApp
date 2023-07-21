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
    @Published var chats = [String : Chat]()
    
    @Published var errorMessage = ""
    
    let firestore: Firestore
    
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        self.firestore = Firestore.firestore()
        
        Task {
            await fetchUser()
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
    
    func signIn(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        } catch {
            print("DEBUG: Failed to log in with error \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut() //signs user out on backend
            self.userSession = nil //wipes out user session and takes us ack to login screen
            self.currentUser = nil
            self.chats = [:]
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
        
        await fetchChats()
        
//        print("DEBUG: Current user is \(self.currentUser)")
    }
    
    func fetchChats() async {
        guard let uid = Auth.auth().currentUser?.uid else {
            print("didn't fetch chats")
            return }

        
        self.firestore.collection("users")
            .document(uid).collection("chats")
            .order(by: "day")
            .addSnapshotListener { querySnapshot, error in

            if let error = error {
                print("DEBUG: Failed to listen for chats: \(error)")
                return
            }
            
            querySnapshot?.documentChanges.forEach({ change in
                if change.type == .added {
                    let data = change.document.data()
                    let chatId = data["chatId"] as? String
                    let day = data["day"] as? Timestamp
//                    self.currentUser?.chats.append(Chat(id: chatId ?? "0", day: day ?? Date.now))
                    self.chats[chatId ?? "0"] = Chat(id: chatId ?? "0", day: day?.dateValue() ?? Date.now)
                    print(self.chats.count)
                    
                    
                    self.firestore.collection("users")
                        .document(uid).collection("chats")
                        .document(chatId ?? "0").collection("messages")
                        .order(by: "timestamp")
                        .addSnapshotListener { querySnapshot, error in
         
                            if let error = error {
                                print("DEBUG: Failed to listen for messages: \(error)")
                                return
                            }
                            
                            querySnapshot?.documents.forEach({ queryDocumentSnapshot in
                                let data = queryDocumentSnapshot.data()
                                let text = data["text"] as? String
                                self.chats[chatId ?? "0"]?.messages.append(text ?? "")
        //                        print(text)
                            })
                        
         
                    }
                }
            })
            
            

        }
        print("chats count: \(self.chats.count)")
        //self.chats.count is 0 even though the chats show up in history
        //for some reason, not entering this next for loop
//        for (chatId, chat) in self.chats {
////            let chatId = chat.id
//            print("here")
//            self.firestore.collection("users")
//                .document(uid).collection("chats")
//                .document(chatId).collection("messages")
//                .order(by: "timestamp")
//                .addSnapshotListener { querySnapshot, error in
//
//                    if let error = error {
//                        print("DEBUG: Failed to listen for messages: \(error)")
//                        return
//                    }
//
//                    querySnapshot?.documents.forEach({ queryDocumentSnapshot in
//                        let data = queryDocumentSnapshot.data()
//                        let text = data["text"] as? String
//                        chat.messages.append(text ?? "")
////                        print(text)
//                    })
//
//
//            }
//        }
        
//        print(self.chats)
    }
    
}
