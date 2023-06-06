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
    
    @Environment(\.presentationMode) var presentation
    @State var showRegisterPage = false
    
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
                        
                        InputField(placeHolder: "Username", stateVar: username)
                        
                        InputField(placeHolder: "Password", stateVar: password)
                        
                        CustomButton(text: "Sign In", backGroundColor: Color.green) {
                            // TODO: authenticate and sign in action
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
                }
                
            }.padding(.all)
        }
        .navigate(to: RegistrationView(), when: $showRegisterPage)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


