//
//  LogInView.swift
//  MobileApp
//
//  Created by Steffi Lin on 6/15/23.
//

import SwiftUI

struct LogInView: View {
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
                    VStack(alignment: .leading, spacing: 24) {
                        Text("Login")
                            .font(Font.custom("CarroisGothicSC-Regular", size: 45))
                            .foregroundColor(Color.white)
                        
                        InputView(placeHolder: "Username",
                                  stateVar: $username,
                                  title: "Username")
                        .autocapitalization(.none)
                        
                        InputView(placeHolder: "Password",
                                  stateVar: $password,
                                  title: "Password",
                                  isSecureField: true)
                        .autocapitalization(.none)
                        
                        CustomButton(text: "Sign In",
                                     backGroundColor: Color("Custom Green")) {
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

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}


