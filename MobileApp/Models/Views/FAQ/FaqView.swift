//
//  FaqView.swift
//  MobileApp
//
//  Created by Steffi Lin on 6/24/23.
//

import SwiftUI

struct FaqView: View {
    var body: some View {
        
        NavigationStack {
            Color.bg_green
                .ignoresSafeArea()
                .overlay(
                    ZStack {
                        BackgroundShapeView()
                            .shadow(radius: 2, x: 0, y: -3)
                            
                        VStack(spacing: 0) {
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
                            
                            NavigationLink {
                                ImmigrationFaqView()
                            } label: {
                                FaqTopic(icon: "immigration.icon", name: "Immigration")
                            }

                            
                            
                            NavigationLink {
                                DivorceFaqView()
                            } label: {
                                FaqTopic(icon: "divorce.icon", name: "Divorce")
                            }
                            
                            NavigationLink {
                                JobFaqView()
                            } label: {
                                FaqTopic(icon: "suitcase", name: "Working/Jobs", isSystem: true)
                            }

                            
                            
                            
                            Spacer()
                        }
                    }
                )
        }
                
            
        
    }
}

struct FaqView_Previews: PreviewProvider {
    static var previews: some View {
        FaqView()
    }
}
