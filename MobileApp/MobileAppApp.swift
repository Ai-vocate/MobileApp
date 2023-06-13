//
//  MobileAppApp.swift
//  MobileApp
//
//  Created by Mokhalad on 6/2/23.
//

import SwiftUI

@main
struct MobileAppApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
