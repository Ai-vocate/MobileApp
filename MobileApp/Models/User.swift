//
//  User.swift
//  MobileApp
//
//  Created by Steffi Lin on 6/6/23.
//

import Foundation


class User: Identifiable, Codable {
    let id: String;
    let fullname: String;
    let email: String;
//    let phoneNumber: String;
    let age: Int;
    var chats = [Chat]()
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullname) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        
        return ""
    }
    
    init(id: String, fullname: String, email: String, age: Int, chats: [Chat] = [Chat]()) {
        self.id = id
        self.fullname = fullname
        self.email = email
        self.age = age
        self.chats = chats
    }
    
    init(data: [String: Any]) {
        self.id = data["id"] as? String ?? ""
        self.fullname = data["fullname"] as? String ?? ""
        self.email = data["email"] as? String ?? ""
        self.age = Int(data["age"] as? String ?? "") ?? 0
//        self.chats = data["chats"] as? String ?? ""
    }
    
    func createChat(id: String) {
        
//        self.chats.append(Chat(from: id as! Decoder))
        self.chats.append(Chat(id: id, day: Date.now))
    }
    
    func addMessage(message: String, id: String) {
        
    }
}

extension User {
    static var MOCK_USER = User(id: NSUUID().uuidString, fullname: "Ai Vocate", email: "example@gmail.com", age: 1)
    
}
