//
//  SettingsView.swift
//  MobileApp
//
//  Created by Steffi Lin on 6/16/23.
//

import SwiftUI



struct SettingsView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State var showHomePage = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            
            
            List {
                Section {
                    ZStack {
                        HStack {
                            BackButton() {
                                showHomePage.toggle()
                            }
                            .padding(.trailing, 20)
                            
                            Spacer()
                        }
                        
                        HStack {
                            Text("Settings")
                                .font(.title)
                                .fontWeight(.bold)
                        }
                    }
                }
                .listRowBackground(Color(.clear))
//                .listRowSeparator(.hidden)
                
                
                Section {
                    Button {
                        viewModel.signOut()
                    } label: {
                        HStack(spacing: 12) {
                            Image(systemName: "arrow.backward.circle.fill")
                                .imageScale(.small)
                                .font(.title)
                                .foregroundColor(Color(.red))
                            Text("Sign Out")
                                .font(.subheadline)
                                .foregroundColor(.black)
                        }
                    }
                }
            
                
            }
            
            

            
            Spacer()
        }
        .navigate(to: HomeView(), when: $showHomePage)
    
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
