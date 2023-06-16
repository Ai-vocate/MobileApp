////
////  RegistrationView.swift
////  MobileApp
////
////  Created by Steffi Lin on 6/10/23.
////
//
//import Foundation
//import SwiftUI
//
//struct SignUpView: View {
////    @State private var name: String = ""
////    @State private var age: String = ""
////    @State private var phoneNumber: String = ""
//    @State private var username: String = ""
//    @State private var password: String = ""
//    @State private var confirmPassword: String = ""
//    
//    @State private var isValidLogin: Bool = false
//    @State private var isValidPassword: Bool = false
//    
//    @State var showRegistrationPage = false
//    
//    var body: some View {
//        VStack {
//            HStack {
//                BackButton() {
//                    showRegistrationPage.toggle()
//                }.padding(.all)
//                
//                Spacer()
//            }
//            
//            
//            Image("aivocate logo")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .padding(.all)
//            
//            BackGroundRoundedRectangle()
//                .overlay(
//                    VStack(alignment: .leading, spacing: 17) {
////                        Text("Registration")
////                            .font(.title)
////                            .foregroundColor(Color.white)
//                        
// 
//                        
//                        InputField(placeHolder: "Username", stateVar: username, title: "Username")
//                        
//                        
//                        InputField(placeHolder: "Password", stateVar: password, isSecureField: true, title: "Password")
//                        
//                        InputField(placeHolder: "Confirm Password", stateVar: confirmPassword, title: "Confirm Password")
//                        
//                        CustomButton(text: "Sign Up", backGroundColor: Color.green) {
//                            // TODO: sign up action.
//                        }
//                        .disabled((isValidLogin && isValidPassword) == false)
//                        
//                        Spacer()
//                    }
//                        .padding(.all, 55)
//                )
//            Spacer()
//        }
//        .navigate(to: RegistrationView(), when: $showRegistrationPage)
//    }
//        
//}
//
//struct SignUpView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignUpView()
//    }
//}
