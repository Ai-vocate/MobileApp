//
//  ChatLogViewModel.swift
//  MobileApp
//
//  Created by Steffi Lin on 7/27/23.
//

import Foundation


class ChatLogViewModel : ObservableObject {
    @Published var chatText = ""
    @Published var chatMessages = [ChatMessage]()
    
    let chatId: String?
    
    init(chatId: String?) {
        self.chatId = chatId
//        Task {
//            await fetchMessages()
//        }
        fetchMessages()
    }
    
    private func fetchMessages() {
        guard let uid = AuthViewModel.shared.auth.currentUser?.uid else { return }
        guard let chatId = chatId else { return }
        if chatId == "" {
            print("failed to fetch messages")
            return
            
        }
        print("here")
        
        AuthViewModel.shared.firestore
            .collection("users")
            .document(uid).collection(chatId)
            .order(by: "timestamp")
            .addSnapshotListener { querySnapshot, error in

                if let error = error {
                    print("DEBUG: Failed to listen for messages: \(error)")
                    return
                }
                
                querySnapshot?.documentChanges.forEach({ change in
                    if change.type == .added {
                        let data = change.document.data()
//                        let text = data["text"] as? String
                       
                        let docId = change.document.documentID
                        let chatMessage = ChatMessage(documentId: docId, data: data)
                        self.chatMessages.append(chatMessage)
                        print("messages: ")
                        print(self.chatMessages.count)
//                        self.chats[chatId ?? "0"]?.messages.append(text ?? "")
                    }
                    
                })
            

        }
    }
}
