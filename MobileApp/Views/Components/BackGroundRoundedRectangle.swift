//
//  BackGroundRoundedRectangle.swift
//  MobileApp
//
//  Created by Mo Aljuboori on 6/5/23.
//

import SwiftUI

struct BackGroundRoundedRectangle: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color(red: 0.30, green: 0.30, blue: 0.30))
            .padding(.all, 27.5)
            .shadow(radius: 20)
    }
}

struct BackGroundRoundedRectangle_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            BackGroundRoundedRectangle()
        }
    }
}
