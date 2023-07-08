//
//  Chat.swift
//  MobileApp
//
//  Created by Steffi Lin on 7/7/23.
//

import Foundation

class Chat: Identifiable, Codable, ObservableObject {
    //use stateobject to pass chats into views?
    let id: String
    var messages = [String]()
    let day: Date
    
    init(id: String, messages: [String] = [String](), day: Date) {
        self.id = id
        self.messages = messages
        self.day = day
    }
}
