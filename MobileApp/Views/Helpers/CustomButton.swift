//
//  CustomButton.swift
//  MobileApp
//
//  Created by Mo Aljuboori on 6/5/23.
//

import SwiftUI

struct CustomButton: View {
    let text: String
    let backGroundColor: Color
    var body: some View {
        Button(text) {
        }
            .font(.headline)
            .foregroundColor(.black)
            .padding()
            .frame(width: 150, height: 50)
            .background(backGroundColor)
            .cornerRadius(15.0)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.black, lineWidth: 2)
            )
        
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(text: "Sign Up", backGroundColor: Color.clear)
    }
}
