//
//  RegistrationView.swift
//  MobileApp
//
//  Created by Mo Aljuboori on 6/5/23.
//

import Foundation
import SwiftUI

struct RegistrationView: View {
    @State private var name: String = ""
    @State private var age: String = ""
    @State private var phoneNumber: String = ""
    @State private var email: String = ""
//    @State private var username: String = ""
//    @State private var password: String = ""
//    @State private var confirmPassword: String = ""
//
//    @State private var isValidLogin: Bool = false
//    @State private var isValidPassword: Bool = false
    
    @State var showLoginPage = false
    @State var showSignUpPage = false
    
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
                    VStack(alignment: .leading, spacing: 17) {
//                        Text("Registration")
//                            .font(.title)
//                            .foregroundColor(Color.white)
                        
                        HStack {
                            InputField(placeHolder: "Full Name", stateVar: name, title: "Name")
                            InputField(placeHolder: "Age", stateVar: age, title: "Age")
                        }
                        
                        InputField(placeHolder: "Phone Number", stateVar: phoneNumber, title: "Phone Number")
                        
                        InputField(placeHolder: "example@example.com", stateVar: email, title: "Email")
                        
//                        InputField(placeHolder: "Username", stateVar: username, title: "Username")
//
//
//                        InputField(placeHolder: "Password", stateVar: password, title: "Password")
//
//                        InputField(placeHolder: "Confirm Password", stateVar: confirmPassword, title: "Confirm Password")
                        
//                        CustomButton(text: "Sign Up", backGroundColor: Color.green) {
//                            // TODO: sign up action.
//                        }
//                        .disabled((isValidLogin && isValidPassword) == false)
                        
                        CustomButton(text: "Next", backGroundColor: Color.green) {
                            showSignUpPage.toggle()
                        }
                        
                        
                        
                        Spacer()
                    }
                        .padding(.all, 55)
                )
            Spacer()
        }
        .navigate(to: ContentView(), when: $showLoginPage)
        .navigate(to: SignUpView(), when: $showSignUpPage)
    }
        
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
