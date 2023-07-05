//
//  HistoryRow.swift
//  MobileApp
//
//  Created by Sean She on 6/30/23.
//

import SwiftUI

struct HistoryRow: View {
    
    let date: String
    let topic: String
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
                .opacity(0.8)
                .frame(height: 70)
                .shadow(radius: 2, x: 0, y: 3)
            
            HStack {
                Text(date)
                    .fontWeight(.light)
                Text(topic)
                    .fontWeight(.semibold)
                Spacer()
            }
            .foregroundColor(.black)
            .padding(.horizontal)
            .frame(height: 70)
            
        }
    }
}

struct HistoryRow_Previews: PreviewProvider {
    static var previews: some View {
        HistoryRow(date: "01/12", topic: "Immigration")
    }
}
