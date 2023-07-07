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
    var chats = [String : Chat]()
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullname) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        
        return ""
    }
    
    init(id: String, fullname: String, email: String, age: Int, chats: [String: Chat] = [String: Chat]()) {
        self.id = id
        self.fullname = fullname
        self.email = email
        self.age = age
        self.chats = chats
    }
    
    func creatChat(id: String) {
        
        self.chats[id] = Chat(id: id)
    }
    
    func addMessage(message: String, id: String) {
        
    }
}

extension User {
    static var MOCK_USER = User(id: NSUUID().uuidString, fullname: "Ai Vocate", email: "example@gmail.com", age: 1)
    
}
