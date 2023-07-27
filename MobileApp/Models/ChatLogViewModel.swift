//
//  ChatLogViewModel.swift
//  MobileApp
//
//  Created by Steffi Lin on 7/27/23.
//

import Foundation


class ChatLogViewModel : ObservableObject {
    @Published var chatText = ""
//    @Published var chatMessages = [ChatMessage]()
    
    let chatId: String?
    
    init(chatId: String?) {
        self.chatId = chatId
        fetchMessages()
    }
    
    private func fetchMessages() {
        
    }
}
