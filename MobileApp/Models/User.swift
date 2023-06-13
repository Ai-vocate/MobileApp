//
//  User.swift
//  MobileApp
//
//  Created by Steffi Lin on 6/6/23.
//

import Foundation


struct User: Identifiable, Codable {
    let id: String;
    let fullname: String;
    let email: String;
    let phoneNumber: String;
    let age: Int;
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullname) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        
        return ""
    }
}

extension User {
    static var MOCK_USER = User(id: NSUUID().uuidString, fullname: "Ai Vocate", email: "example@gmail.com", phoneNumber: "1234567890", age: 1)
    
}
