//
//  ChatMessage.swift
//  MobileApp
//
//  Created by Steffi Lin on 7/27/23.
//

import Foundation

struct ChatMessage: Identifiable {
    
    var id: String { documentId }
    
    let documentId: String
    let fromId, chatId, text : String
    let timestamp: Date
    
    init(documentId: String, data: [String: Any]) {
        self.documentId = documentId
        self.chatId = data["chatId"] as? String ?? ""
        self.fromId = data["fromId"] as? String ?? ""
        self.text = data["text"] as? String ?? ""
        self.timestamp = data["timestamp"] as? Date ?? Date.now
    }
}
