//
//  InputField.swift
//  MobileApp
//
//  Created by Mo Aljuboori on 6/5/23.
//

import SwiftUI

struct InputField: View {
    var placeHolder: String
    @State var stateVar: String
    var isSecureField = false
    var title: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
            
            if isSecureField {
                SecureField(text: $stateVar, prompt: Text(placeHolder).foregroundColor(.white)) {
                    Text("hi")
                }
                    .padding()
                    .background(.clear)
                    .cornerRadius(20.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.white, lineWidth: 1)
                    )
                    .foregroundColor(.white)
            } else {
                TextField(text: $stateVar, prompt: Text(placeHolder).foregroundColor(.white)) {
                    Text("hi")
                }
                    .padding()
                    .background(.clear)
                    .cornerRadius(20.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.white, lineWidth: 1)
                    )
                    .foregroundColor(.white)
            }
            
            
        }
        
    }
}

struct InputField_Previews: PreviewProvider {
    @State private static var username: String = ""
    static var previews: some View {
        InputField(placeHolder: "Sign in", stateVar: self.username, title: "Username").background(.black)
    }
}
