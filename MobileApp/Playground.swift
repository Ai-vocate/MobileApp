//
//  Playground.swift
//  MobileApp
//
//  Created by Mo Aljuboori on 6/5/23.
//

import SwiftUI

struct Playground: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        Form {
            TextField(text: $username, prompt: Text("Required")) {
                Text("Username")
            }
            SecureField(text: $password, prompt: Text("Required")) {
                Text("Password")
            }
        }
    }
    
}

struct Playground_Previews: PreviewProvider {
    static var previews: some View {
        Playground()
    }
}
