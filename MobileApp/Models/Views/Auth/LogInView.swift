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
    
    var body: some View {
        NavigationStack {
            VStack {
                // Image
                Image("aivocate logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.all)
                
                
                // Form Fields
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
                    }
                    .padding(.all, 55)
                    .background(BackGroundRoundedRectangle())
                            
                            
                Spacer()
                
                //                 Signup/Guest Buttons
                VStack {
                    NavigationLinkView(desination: {
                        RegistrationView()},
                                       text: "Sign up",
                                       backGroundColor: Color.clear)
                    
                    NavigationLinkView(desination: {
                        ChatBotView()},
                                       text: "Guest",
                                       backGroundColor: Color.clear)
                }
            }
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}




