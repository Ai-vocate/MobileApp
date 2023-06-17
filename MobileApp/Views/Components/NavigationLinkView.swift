//
//  NavigationLinkView.swift
//  MobileApp
//
//  Created by Mo Aljuboori on 6/16/23.
//

import SwiftUI

struct NavigationLinkView<Content: View>: View {
    var desination: () -> Content
    let text: String
    let backGroundColor: Color
    
    var body: some View {
        
        NavigationStack {
            NavigationLink {
                desination()
            } label: {
                Text(text)
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
        }
    }
}

struct NavigationLinkView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationLinkView(desination: { RegistrationView()},
                           text: "Sign Up",
                           backGroundColor: Color.clear)
    }
}
