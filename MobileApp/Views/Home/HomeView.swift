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
    
    var showPreview = false;
    var body: some View {
        if !showPreview {
            if let user = viewModel.currentUser {
                NavigationStack {
                    ZStack {
                        Color.bg_green
                            .ignoresSafeArea()
                        
                        ZStack {
                            BackgroundShapeView(isHome: true)
                                .shadow(radius: 2, x: 0, y: 3)
                                .ignoresSafeArea()
                            
                            
                            List {
                                Section {
                                    HStack {
                                        Text(user.initials)
                                            .font(.title)
                                            .fontWeight(.semibold)
                                            .foregroundColor(.white)
                                            .frame(width: 72, height: 72)
                                            .background(Color.chat_text)
                                            .clipShape(Circle())
                                        
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text("Welcome,")
                                            Text(user.fullname)
                                                .fontWeight(.semibold)
                                            
                                        }
                                        .padding(.leading, 10)
                                    }
                                }
                                .listRowBackground(Color(.white).opacity(0.8))
                                
                                Section {
                                    NavigationLink {
                                        SettingsView()
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
                                .listRowBackground(Color(.white).opacity(0.8))
                                
                                Section {
                                    Spacer()
                                    Spacer()
                                }
                                .listRowBackground(Color.clear)
                                .listRowSeparator(.hidden)
                                
                                Section {
                                    HStack {
                                        Spacer()
                                        Image("avatar")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: UIScreen.main.bounds.size.width * 0.3)
                                            .padding(.all)
                                        
                                    }
                                    
                                }
                                .listRowBackground(Color.clear)
                                
                                
                                
                                
                            }
                            .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 2)
                            .scrollContentBackground(.hidden)
                        }
                    }
                }
            }
        } // If showPreview
        else {
            var user = User(id: NSUUID().uuidString, fullname: "Ai Vocate", email: "example@gmail.com", age: 1)
            NavigationStack {
                ZStack {
                    Color.bg_green
                        .ignoresSafeArea()
                    
                    ZStack {
                        BackgroundShapeView(isHome: true)
                            .shadow(radius: 2, x: 0, y: 3)
                            .ignoresSafeArea()
                        
                        
                        List {
                            Section {
                                HStack {
                                    Text(user.initials)
                                        .font(.title)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                        .frame(width: 72, height: 72)
                                        .background(Color.chat_text)
                                        .clipShape(Circle())
                                    
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("Welcome,")
                                        Text(user.fullname)
                                            .fontWeight(.semibold)
                                        
                                    }
                                    .padding(.leading, 10)
                                }
                            }
                            .listRowBackground(Color(.white).opacity(0.8))
                            
                            Section {
                                NavigationLink {
                                    SettingsView()
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
                            .listRowBackground(Color(.white).opacity(0.8))
                            
                            Section {
                                Spacer()
                                Spacer()
                            }
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                            
                            Section {
                                HStack {
                                    Spacer()
                                    Image("avatar")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: UIScreen.main.bounds.size.width * 0.3)
                                        .padding(.all)
                                    
                                }
                                
                            }
                            .listRowBackground(Color.clear)
                            
                            
                            
                            
                        }
                        .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 2)
                        .scrollContentBackground(.hidden)
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
