//
//  SettingsView.swift
//  MobileApp
//
//  Created by Steffi Lin on 6/16/23.
//

import SwiftUI



struct SettingsView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Settings")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("yay")

            
            Spacer()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
