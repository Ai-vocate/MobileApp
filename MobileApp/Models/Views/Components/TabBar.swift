//
//  TabBar.swift
//  MobileApp
//
//  Created by Sean She on 6/21/23.
//

// Resources
// https://www.youtube.com/watch?v=vzQDKYIKEb8&ab_channel=Indently
// https://www.youtube.com/watch?v=Yg3cmpKNieU&ab_channel=ASwiftlyTiltingPlanet
// https://www.youtube.com/watch?v=TgvYFfCjDMo&t=238s&ab_channel=Indently



import SwiftUI

let tabBarItems = ["house", "questionmark.circle", "bubble.left.and.bubble.right", "clock.arrow.circlepath"]


struct TabBar: View {
    
    @Binding var selectedTab: String
    
    var body: some View {
        HStack {
            ForEach(tabBarItems, id: \.self) { tab in
                Spacer()
                Image(systemName: tab)
                    .scaleEffect(selectedTab == tab ? 1.25 : 1.0)
                    .foregroundColor(selectedTab == tab ? .green : .black)
                    .font(.system(size: 21))
                    .onTapGesture {
                        withAnimation(.easeIn(duration: 0.1)) {
                            selectedTab = tab
                        }
                    }
                Spacer()
            }
        }
        .frame(width: nil, height: 60)
        .background(Color(.white))
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(selectedTab: .constant("house"))
    }
}
