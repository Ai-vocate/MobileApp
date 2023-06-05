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
            .fill(Color(red: 0.64, green: 0.64, blue: 0.64))
            .padding(.all, 27.5)
    }
}

struct BackGroundRoundedRectangle_Previews: PreviewProvider {
    static var previews: some View {
        BackGroundRoundedRectangle()
    }
}
