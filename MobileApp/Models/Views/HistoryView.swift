//
//  HistoryView.swift
//  MobileApp
//
//  Created by Steffi Lin on 6/24/23.
//

import SwiftUI

struct HistoryView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
   
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.bg_green.ignoresSafeArea()
                BackgroundShapeView().shadow(radius: 2, x: 0, y: -3)
                
                VStack {
                    LogoHeader()
                    Spacer()
                    
                    ScrollView {
                        if let user = viewModel.currentUser {
                            let chats = viewModel.chats
                            ForEach(chats, id: \.id) { chat in
                                NavigationLink {
                                
                                    ChatBotView()
                                } label: {
                                    HistoryRow(date: chat.day.formatted(date: .abbreviated, time: .omitted ) , topic: "Immigration")
                                        .padding(.vertical, 2.0)
                                        .padding(.horizontal, 37.5)
                                }
                            }
                        } else {
//                            let user = User.MOCK_USER
                            ForEach(0 ..< 15) { item in
                                NavigationLink {
                                    // TODO: Replace this with a chatbot view that contains chat history
                                    ChatBotView()
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
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
