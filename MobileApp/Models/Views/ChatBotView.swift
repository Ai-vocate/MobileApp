//
//  Chatbot.swift
//  MobileApp
//
//  Created by Mo Aljuboori on 6/8/23.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct ChatBotView: View {
    @ObservedObject var APIviewModel = APICaller()
    @State var text = ""
    @State var models = [String]()
    
    @EnvironmentObject var viewModel: AuthViewModel
    
//    @EnvironmentObject var chat: Chat
    
    @State var chatId = "0"

    
    // This is temporary. Need to get user info from database.
    
//    let user = User(id: "0",
//                    fullname: "Mokhalad Aljuboori",
//                    email: "example@gmail.com",
//                    age: 20)
    
    let aiUser = User(id: NSUUID().uuidString, fullname: "Ai Vocate", email: "example@gmail.com", age: 1)
    
    
    var body: some View {
        
        if let user = viewModel.currentUser {
            ZStack {
                Color.bg_green
                    .ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    LogoHeader()
                    
                    Text(chatId)
                    ForEach(models, id: \.self) { string in
                        HStack(alignment: .top) {
//                            Text(string)
                            if string.contains("Me:") {
                                Spacer()
                                MessageView(message: string)
                                initalsView(user: user)
                            } else {
                                initalsView(user: aiUser)
                                MessageView(message: string)
                                Spacer()
                            }
                        }.padding(.horizontal)
                    }
                    Spacer()
                    
                    HStack {
                        TextField("Type here...", text: $text)
                        Button("Send") {
                            send()
                        }
                    }.padding(.all)
                    Spacer().frame(height: 38.0) // Spacer for Tab Bar
                }
                .onAppear {
                    APIviewModel.setup()
                    models.removeAll()
                    initializeModels()
                    print(viewModel.chats[chatId]?.messages)
                }
            }
            
        } else {
            let user = User(id: NSUUID().uuidString, fullname: "Ai Vocate", email: "example@gmail.com", age: 1)
            
            ZStack {
                Color.bg_green
                    .ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    LogoHeader()
                    
                    
                    ForEach(models, id: \.self) { string in
                        HStack(alignment: .top) {
                            if string.contains("Me:") {
                                Spacer()
                                MessageView(message: string)
                                initalsView(user: user)
                            } else {
                                initalsView(user: aiUser)
                                MessageView(message: string)
                                Spacer()
                            }
                        }.padding(.horizontal)
                    }
                    Spacer()
                    
                    HStack {
                        TextField("Type here...", text: $text)
                        Button("Send") {
//                            send()
                        }
                        .onTapGesture {
                            send()
                        }
                    }.padding(.all)
                    Spacer().frame(height: 38.0) // Spacer for Tab Bar
                }
                .onAppear {
                    APIviewModel.setup()
                }
            }
        }
        
    }
    
    func initializeModels() {
        self.models = viewModel.chats[chatId]?.messages ?? []
    }
        
    
    
    func initalsView(user: User) -> some View {
        Text(user.initials)
            .font(.title2)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .frame(width: 55.0, height: 55.0)
            .background(Color.chat_text)
            .clipShape(Circle())
            .padding(.horizontal, 4)
    }
    
    func send() {
        guard !text.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        
        models.append("Me: \(text)")
        // Add history + text to viewModel.send;
        saveMessage(message: "Me: \(text)", isUser: true)
        APIviewModel.send(text: text) { response in
            DispatchQueue.main.async {
                self.models.append("ChaptGPT: " + response)
//                print(response)
                saveMessage(message: "ChaptGPT: " + response, isUser: false)
                self.text = ""
            }
        }
        
    }
    
    func saveMessage(message: String, isUser: Bool) {

        if models.count == 1 {
            //initialize new chat for the user
            self.chatId = NSUUID().uuidString
//            viewModel.currentUser?.createChat(id: chatId)
//            chat = 
            
        }
        //add message to user chat
//        viewModel.currentUser?.chats[0].messages.append(message)
        
        guard let fromId = viewModel.userSession?.uid else { return }
//            guard let toId = aiUser.uid else { return }
//        }
        
        //save chat data
        let documentchat = viewModel.firestore.collection("users")
            .document(fromId)
            .collection("chats")
            .document(chatId)
        
        let chatData = ["chatId": chatId, "day": Timestamp()] as [String : Any]
        documentchat.setData(chatData) { error in
            if let error = error {
                print(error)
                print("DEBUG: failed to save chat to Firebase")
            }
             
        }

        
        //save message data
        let document = viewModel.firestore.collection("users")
            .document(fromId)
            .collection("chats")
            .document(chatId)
            .collection("messages")
            .document()
        
        let messageData = ["fromId": fromId, "text": message, "timestamp": Timestamp()] as [String : Any]
        document.setData(messageData) { error in
            if let error = error {
                print(error)
                print("DEBUG: failed to save message to Firebase")
            }
             
        }
    }
}

struct ChatBubbleShape: Shape {
    var sentByUser: Bool
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: sentByUser ? [.topLeft, .topRight, .bottomLeft] : [.topLeft, .topRight, .bottomRight], cornerRadii: CGSize(width: 20, height: 20))
        
        return Path(path.cgPath)
    }
}

struct MessageView: View {
    var message: String
    var sentByUser: Bool { message.contains("Me:") }
    
    
    var body: some View {
        HStack {

            Text(message)
                .padding(.all)
                .background(ChatBubbleShape(sentByUser: sentByUser).fill(sentByUser ? Color.blue : Color.gray))
            
        }
    }
}

struct ChatBotView_Previews: PreviewProvider {
    static var previews: some View {
        ChatBotView()
    }
}
