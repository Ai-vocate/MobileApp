//
//  Chat.swift
//  MobileApp
//
//  Created by Steffi Lin on 7/7/23.
//

import Foundation

class Chat: Identifiable, Codable, ObservableObject {
    let id: String
    var messages = [String]()
    let day: Date
    
    
}
