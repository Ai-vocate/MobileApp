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
            action()
        }
            .font(Font.custom("Lato-Regular", size: 15))
            .foregroundColor(.black)
            .frame(width: 140, height: 42)
            .background(backGroundColor)
            .cornerRadius(17.0)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.black, lineWidth: 2)
            )

    }
    var action: () -> Void = {}
}


struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(text: "Sign Up", backGroundColor: Color("Custom Green"))
    }
}
