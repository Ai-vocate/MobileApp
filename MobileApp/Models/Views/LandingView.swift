//
//  LandingView.swift
//  MobileApp
//
//  Created by Sean She on 6/21/23.
//

import SwiftUI

struct LandingView: View {
    
    @State private var selectedTab = "house"
    
    var body: some View {
        TabView (selection: $selectedTab) {
            HomeView()
                .tag("house")
            FaqView()
                .tag("questionmark.circle")
            ChatBotView()
                .tag("bubble.left.and.bubble.right")
            HistoryView()
                .tag("clock.arrow.circlepath")
            

        }
        .overlay(alignment: .bottom) {
            TabBar(selectedTab: $selectedTab)
        }
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}