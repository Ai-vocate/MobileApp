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
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
//    @State private var username: String = ""
//    @State private var phoneNumber: String = ""
//    @State private var password: String = ""
//    @State private var confirmPassword: String = ""
    
//    @State private var isValidLogin: Bool = false
//    @State private var isValidPassword: Bool = false
//    @State private var isValidLogin: Bool = true
//    @State private var isValidPassword: Bool = true
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            
            Image("aivocate logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.all)
            
            
            VStack {
                VStack(alignment: .leading, spacing: 17) {
                    HStack {
                        InputView(placeHolder: "Full Name",
                                  stateVar: $fullname,
                                  title: "Name")
                        InputView(placeHolder: "Age",
                                  stateVar: $age,
                                  title: "Age")
                    }
                    
                    InputView(placeHolder: "example@example.com", stateVar: $email, title: "Email")
                    
                    InputView(placeHolder: "Password",
                              stateVar: $password,
                              title: "Password",
                              isSecureField: true)
                    
                    InputView(placeHolder: "Confirm Password",
                              stateVar: $confirmPassword,
                              title: "Confirm Password",
                              isSecureField: true)
                    

                    
                    CustomButton(text: "Sign Up", backGroundColor: Color.green) {
                        Task {
                            print(password)
                            try await viewModel.createUser(withEmail: email, password: password, fullname: fullname, age: Int(age) ?? 0)
                        }
                    }.padding(.top)
//                        .disabled((isValidLogin && isValidPassword) == false)
                    
                }
                .padding(.all, 55)
                    .background(BackGroundRoundedRectangle())
                        
                Spacer()
            }
            
        }
    }
        
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
