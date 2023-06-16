//
//  MobileAppApp.swift
//  MobileApp
//
//  Created by Mokhalad on 6/2/23.
//

import SwiftUI
import Firebase

@main
struct MobileAppApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
