//
//  LogoHeader.swift
//  MobileApp
//
//  Created by Steffi Lin on 6/24/23.
//

import SwiftUI

struct LogoHeader: View {
    var body: some View {
        Image("aivocate logo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(.leading, 60)
            .padding(.trailing, 60)
            .padding(.bottom)
            .background(Color(.white))
    }
}

struct LogoHeader_Previews: PreviewProvider {
    static var previews: some View {
        LogoHeader()
    }
}
