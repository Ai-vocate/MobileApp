//
//  ContentView.swift
//  MobileApp
//
//  Created by Mokhalad on 6/2/23.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    @Environment(\.presentationMode) var presentation
    @State var showRegisterPage = false
    @State var showChatPage = false
    
    var body: some View {
        VStack {
            Image("aivocate logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.all)
            
            BackGroundRoundedRectangle()
                .overlay(
                    VStack(alignment: .leading, spacing: 25) {
                        Text("Login")
                            .font(.title)
                            .foregroundColor(Color.white)
                        
                        InputField(placeHolder: "Username", stateVar: username, title: "Username").autocapitalization(.none)
                        
                        InputField(placeHolder: "Password", stateVar: password, isSecureField: true, title: "Password").autocapitalization(.none)
                        
                        CustomButton(text: "Sign In", backGroundColor: Color.green) {
                            // TODO: authenticate and sign in action
                            Task {
                                try await viewModel.signIn(withEmail: username, password: password)
                            }
                            
                        }
                        Spacer()
                    }
                        .padding(.all, 55)
                )
            VStack(spacing: 25) {
                CustomButton(text: "Sign Up", backGroundColor: Color.clear) {
                    showRegisterPage.toggle()
                }
                
                CustomButton(text: "Guest", backGroundColor: Color.clear) {
                    // TODO: guest sign in
                    showChatPage.toggle()
                }
                
            }.padding(.all)
        }
        .navigate(to: RegistrationView(), when: $showRegisterPage)
        .navigate(to: ChatBotView(), when: $showChatPage)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


