//
//  HistoryView.swift
//  MobileApp
//
//  Created by Steffi Lin on 6/24/23.
//

import SwiftUI

struct HistoryView: View {
    var body: some View {
        NavigationStack {
            Color.bg_green
                .ignoresSafeArea()
                .overlay(
                    ZStack {
                        BackgroundShapeView()
                            .shadow(radius: 2, x: 0, y: -3)
                        
                        VStack {
                            LogoHeader()
                            
                            Spacer()
                        }
                    }
                )
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
