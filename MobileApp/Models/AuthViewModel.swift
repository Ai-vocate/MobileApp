//
//  AuthViewModel.swift
//  MobileApp
//
//  Created by Steffi Lin on 6/13/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User? //tells us whether user is logged in
    @Published var currentUser: User?
    
    init() {
        
    }
    
    func signIn(withEmail email: String, password: String) async throws {
        print("sign in...")
    }
    
    func createUser(withEmail email: String, password: String, fullname: String, age: Int) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            print("here")
            self.userSession = result.user
            let user = User(id: result.user.uid, fullname: fullname, email: email, age: age)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
        
    }
    
    func signOut() {
        print("sign out...")
    }
    
    func deleteAccount() {
        print("delete account...")
    }
    
    func fetchUser() async {
        
    }
    
}
