//
//  Chatbot.swift
//  MobileApp
//
//  Created by Mo Aljuboori on 6/8/23.
//

import SwiftUI

struct ChatBotView: View {
    @ObservedObject var viewModel = APICaller()
    @State private var text: String = ""
    @State var models = [String]()

    var body: some View {
        ZStack {
            Color.bg_green
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                LogoHeader()

                ForEach(models, id: \.self) { string in
                    MessageView(message: string)
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
                viewModel.setup()
            }
        }
    }
    
    func send() {
        guard !text.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        models.append("Me: \(text)")
        // Add history + text to viewModel.send;
        viewModel.send(text: text) { response in
            DispatchQueue.main.async {
                self.models.append("ChaptGPT: " + response)
                self.text = ""
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
            if sentByUser {
                Spacer()
            }
            
            Text(message)
                .padding(.all)
                .background(ChatBubbleShape(sentByUser: sentByUser).fill(sentByUser ? Color.blue : Color.gray))
            
            if !sentByUser {
                Spacer()
            }
        }.padding(.all)
    }
}

struct ChatBotView_Previews: PreviewProvider {
    static var previews: some View {
        ChatBotView()
    }
}
