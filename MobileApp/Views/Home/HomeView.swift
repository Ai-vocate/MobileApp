//
//  HomeView.swift
//  MobileApp
//
//  Created by Steffi Lin on 6/10/23.
//

import SwiftUI



struct HomeView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State var showSettingsView = false
    
    
    var body: some View {
        if let user = viewModel.currentUser {
            List {
                Section {
                    HStack {
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 72, height: 72)
                            .background(Color(.systemGray3))
                        .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Welcome,")
                            Text(user.fullname)
                                .fontWeight(.semibold)
                   
                        }
                        .padding(.leading, 10)
                    }
                }
                
                Section {
                    
                    Button {
                        print("settings...")
                        showSettingsView.toggle()
                    } label: {
                        HStack(spacing: 12) {
                            Image(systemName: "gear")
                                .imageScale(.small)
                                .font(.title)
                                .foregroundColor(Color(.systemGray))
                            Text("Settings")
                                .font(.subheadline)
                                .foregroundColor(.black)
                        }
                    }
                    
                    Button {
                        print("profile...")
                    } label: {
                        HStack(spacing: 12) {
                            Image(systemName: "person.circle")
                                .imageScale(.small)
                                .font(.title)
                                .foregroundColor(Color(.systemGray))
                            Text("Profile")
                                .font(.subheadline)
                                .foregroundColor(.black)
                        }
                    }
                    
                    
                }
            }
            .navigate(to: SettingsView(), when: $showSettingsView)
        }
            
    }
        
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
