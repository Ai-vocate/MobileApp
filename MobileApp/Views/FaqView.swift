//
//  FaqView.swift
//  MobileApp
//
//  Created by Steffi Lin on 6/24/23.
//

import SwiftUI

struct FaqView: View {
    var body: some View {
        Color.bg_green
            .ignoresSafeArea()
            .overlay(
                ZStack {
                    BackgroundShapeView()
                        
                    VStack {
                        LogoHeader()
                        
                        HStack(alignment: .top) {
                            Image("avatar.right")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.all)
                                
                            ZStack(alignment: .center) {
                                
                                
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.white)
                                    .frame(width:215, height:105)
                                    .padding(.all)
                                    .shadow(radius: 2, x: 3, y: 3)
                                
                                Text("Explore our frequently asked questions through the topics below!")
                                    .foregroundColor(.chat_text)
                                    .frame(width:200, height:100)
                                    .padding(.all)
                                
                            }
                                
                            
                        }
                        .padding(.top, 25)
                        .padding(.leading)
                        .padding(.trailing)
                        
                        Spacer()
                    }
                }
                
            )
        
    }
}

struct FaqView_Previews: PreviewProvider {
    static var previews: some View {
        FaqView()
    }
}
