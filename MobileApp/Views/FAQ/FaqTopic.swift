//
//  FaqTopic.swift
//  MobileApp
//
//  Created by Steffi Lin on 6/24/23.
//

import SwiftUI

struct FaqTopic: View {
    let icon: String
    let name: String
    var isSystem = false
    
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
                .opacity(0.8)
                .frame(width: UIScreen.main.bounds.size.width - 75, height: 70)
                .shadow(radius: 2, x: 0, y: 3)
            
            HStack {
                if isSystem {
                    Image(systemName: icon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.size.width * 0.1)
                        .foregroundColor(.black)
                        .fontWeight(.light)
                        .padding(.leading)
                } else {
                    Image(icon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.size.width * 0.1)
                        .padding(.leading)
                }
                
                
                
                
                Text(name)
                    .fontWeight(.regular)
                    .foregroundColor(.black)
                
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.size.width - 75, height: 80)
//            .padding(.all)
        }
        
    }
}

struct FaqTopic_Previews: PreviewProvider {
    static var previews: some View {
        FaqTopic(icon: "immigration.icon", name: "Immigration")
    }
}
