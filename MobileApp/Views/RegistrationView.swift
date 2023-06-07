//
//  RegistrationView.swift
//  MobileApp
//
//  Created by Mo Aljuboori on 6/5/23.
//

import Foundation
import SwiftUI

struct RegistrationView: View {
    @State private var phoneNumber: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isValidLogin: Bool = false
    @State private var isValidPassword: Bool = false
    
    @State var showLoginPage = false
    
    var body: some View {
        VStack {
            HStack {
                BackButton() {
                    showLoginPage.toggle()
                }.padding(.all)
                
                Spacer()
            }
            
            
            Image("aivocate logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.all)
            
            BackGroundRoundedRectangle()
                .overlay(
                    VStack(alignment: .leading, spacing: 25) {
                        Text("Registration")
                            .font(.title)
                            .foregroundColor(Color.white)
                        
                        HStack {
                            InputField(placeHolder: "Name", stateVar: password)
                            InputField(placeHolder: "Age", stateVar: password)
                        }
                        
                        InputField(placeHolder: "Phone Number", stateVar: phoneNumber)
                        
                        InputField(placeHolder: "Username", stateVar: username)
                        
                        
                        InputField(placeHolder: "Password", stateVar: password)
                        
                        CustomButton(text: "Sign Up", backGroundColor: Color.green) {
                            // TODO: sign up action.
                        }
                        .disabled((isValidLogin && isValidPassword) == false)
                        
                        Spacer()
                    }
                        .padding(.all, 55)
                )
            Spacer()
        }
        .navigate(to: ContentView(), when: $showLoginPage)
    }
        
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
