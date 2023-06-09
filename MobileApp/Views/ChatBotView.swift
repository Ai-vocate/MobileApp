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
        VStack(alignment: .leading) {
            ForEach(models, id: \.self) { string in
                Text(string)
            }
            
            Spacer()
            
            HStack {
                TextField("Type here...", text: $text)
                Button("Send") {
                    send()
                }
            }
        }
        .onAppear {
            viewModel.setup()
        }
        .padding()

    }
    
    
    func send() {
        guard !text.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        models.append("Me: \(text)")
        viewModel.send(text: text) { response in
            DispatchQueue.main.async {
                self.models.append("ChaptGPT: " + response)
                self.text = ""
                
            }
            
        }
    }
}



struct ChatBotView_Previews: PreviewProvider {
    static var previews: some View {
        ChatBotView()
    }
}
