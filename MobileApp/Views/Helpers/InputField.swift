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
    
    var body: some View {
        TextField(text: $stateVar, prompt: Text(placeHolder).foregroundColor(.white)) {
            Text("hi")
        }
            .padding()
            .background(.clear)
            .cornerRadius(20.0)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(.white, lineWidth: 2)
            )
            .foregroundColor(.white)
    }
}

struct InputField_Previews: PreviewProvider {
    @State private static var username: String = ""
    static var previews: some View {
        InputField(placeHolder: "Sign in", stateVar: self.username)
    }
}
