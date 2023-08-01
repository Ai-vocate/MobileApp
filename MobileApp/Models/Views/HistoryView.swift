//
//  HistoryView.swift
//  MobileApp
//
//  Created by Steffi Lin on 6/24/23.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct HistoryView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
   
    @State var chatId: String
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.bg_green.ignoresSafeArea()
                BackgroundShapeView().shadow(radius: 2, x: 0, y: -3)
                
                VStack {
//                    LogoHeader()
                    HStack {
                        Text("Conversations")
                            .font(.title)
                            .fontWeight(.semibold)
                            .padding()
                        Spacer()
                        if let user = viewModel.currentUser {
                            NavigationLink {
                                ChatBotView(chatId: self.chatId)
                            } label: {
                                Text("New")
                            }
//                            .simultaneousGesture(TapGesture.)
                            .onTapGesture {
    //                            await
//                                chatId = UUID().uuidString
                                newChat(chatId: self.chatId)
                            }
                            .padding()
                        }
                        
                        
                    }
                        
                    Spacer()
                    
                    ScrollView {
                        if let user = viewModel.currentUser {
                            let chats = viewModel.chats
                            ForEach(Array(chats.keys), id: \.self) { key in
                                NavigationLink {
                                    
                                    ChatBotView(chatId: key)
                                } label: {
                                    HistoryRow(date: chats[key]?.day.formatted(date: .abbreviated, time: .omitted ) ?? "0" , topic: "Immigration")
                                        .padding(.vertical, 2.0)
                                        .padding(.horizontal, 37.5)
                                }
                                .onTapGesture {
                                    self.chatId = key
                                    
                                }
                            }
                        } else {
//                            let user = User.MOCK_USER
                            ForEach(0 ..< 15) { item in
                                NavigationLink {
                                    // TODO: Replace this with a chatbot view that contains chat history
                                    ChatBotView(chatId: "")
                                } label: {
                                    HistoryRow(date: "01/12", topic: "Immigration")
                                        .padding(.vertical, 2.0)
                                        .padding(.horizontal, 37.5)
                                }
                            }
                        }
                        
                    }
                    .padding(.vertical, 37.5)
                }
            }
        }
        .onAppear {
            chatId = UUID().uuidString
        }
    }
    
    
    
    func newChat(chatId: String) {
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
    }
}




struct HistoryView_Previews: PreviewProvider {

    static var previews: some View {
        HistoryView(chatId: "0")
    }
}
