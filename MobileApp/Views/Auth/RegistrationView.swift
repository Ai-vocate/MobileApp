//
//  RegistrationView.swift
//  MobileApp
//
//  Created by Mo Aljuboori on 6/5/23.
//

import Foundation
import SwiftUI

struct RegistrationView: View {
    @State private var fullname: String = ""
    @State private var age: String = ""
//    @State private var phoneNumber: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
//    @State private var username: String = ""
//    @State private var password: String = ""
//    @State private var confirmPassword: String = ""
//
//    @State private var isValidLogin: Bool = false
//    @State private var isValidPassword: Bool = false
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State var showLoginPage = false
//    @State var showSignUpPage = false
    
    
//    @State private var isValidLogin: Bool = true
//    @State private var isValidPassword: Bool = true
    
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
                            InputView(placeHolder: "Full Name",
                                      stateVar: $fullname,
                                      title: "Name")
                            InputView(placeHolder: "Age",
                                      stateVar: $age,
                                      title: "Age")
                        }
                        
//                        InputField(placeHolder: "Phone Number", stateVar: phoneNumber, title: "Phone Number")
                        
                        InputView(placeHolder: "example@example.com", stateVar: $email, title: "Email")
                        
                        InputView(placeHolder: "Password",
                                  stateVar: $password,
                                  title: "Password",
                                  isSecureField: true)
                        
                        InputView(placeHolder: "Confirm Password",
                                  stateVar: $confirmPassword,
                                  title: "Confirm Password",
                                  isSecureField: true)
                        

                        
//                        CustomButton(text: "Next", backGroundColor: Color.green) {
//                            showSignUpPage.toggle()
//                        }
                        
                        CustomButton(text: "Sign Up", backGroundColor: Color.green) {
                            // TODO: sign up action.
                            Task {
                                print(password)
                                try await viewModel.createUser(withEmail: email, password: password, fullname: fullname, age: Int(age) ?? 0)
                            }
                        }
//                        .disabled((isValidLogin && isValidPassword) == false)
                        
                        
                        
                        Spacer()
                    }
                        .padding(.all, 55)
                )
            Spacer()
        }
        .navigate(to: LogInView(), when: $showLoginPage)
//        .navigate(to: SignUpView(), when: $showSignUpPage)
    }
        
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
