//
//  BackButton.swift
//  MobileApp
//
//  Created by Steffi Lin on 6/6/23.
//

import SwiftUI

struct BackButton: View {
    var body: some View {
        Button() {
            action()
        } label: {
            Image(systemName: "chevron.backward.circle")
        }
    }
    let action: () -> Void
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton(){}
    }
}
