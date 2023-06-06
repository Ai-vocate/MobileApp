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
    
    var body: some View {
        VStack {
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

                        InputField(placeHolder: "Phone Number", stateVar: phoneNumber)
                        
                        InputField(placeHolder: "Username", stateVar: username)
                        
                        HStack {
                            InputField(placeHolder: "...", stateVar: password)
                            InputField(placeHolder: "...", stateVar: password)
                        }
                        InputField(placeHolder: "Password", stateVar: password)
                        
                        Button("Sign Up") {
                            //do smth
                        }
                        .background(Color.green)
                        
//                        CustomButton(text: "Sign Up", backGroundColor: Color.green)
                        Spacer()
                    }
                        .padding(.all, 55)
                )
            Spacer()
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
