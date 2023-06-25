//
//  BackgroundShapeView.swift
//  MobileApp
//
//  Created by Steffi Lin on 6/24/23.
//

import Foundation
import SwiftUI

import CoreGraphics


struct BackgroundShape: Shape {
    
    var isHome = false
    
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        
        if isHome {
            return Path { path in
                path.move(to: CGPoint(x: 0, y: height)) //bottom left corner
                path.addLine(to: CGPoint(x: 0, y: height * 0.55)) //top left "corner" before the curve
                path.addCurve(to: CGPoint(x: width, y: height * 0.3),
                              control1: CGPoint(
                                x: 40,
                                y: height*0.35),
                              control2: CGPoint(
                                x: width-40,
                                y: height*0.55))
                path.addLine(to: CGPoint(x: width, y: height)) //bottom right corner
                path.addLine(to: CGPoint(x: 0, y: height)) //back at start
                path.closeSubpath()
            }
        } else {
            return Path { path in
                path.move(to: CGPoint(x: 0, y: height)) //bottom left corner
                path.addLine(to: CGPoint(x: 0, y: height * 0.55)) //top left "corner" before the curve
                path.addCurve(to: CGPoint(x: width, y: height * 0.2),
                              control1: CGPoint(
                                x: 15,
                                y: height*0.29),
                              control2: CGPoint(
                                x: width-15,
                                y: height*0.41))
                path.addLine(to: CGPoint(x: width, y: height)) //bottom right corner
                path.addLine(to: CGPoint(x: 0, y: height)) //back at start
                path.closeSubpath()
            }
        }
    }
}


struct BackgroundShapeView: View {
    var isHome = false
    
    var body: some View {
        
        
        if isHome {
            BackgroundShape(isHome: true)
                .fill(LinearGradient(colors: [.bg_gradient_green, .bg_gradient_brown], startPoint: .center, endPoint: .bottomTrailing))
                .opacity(0.8)
                .rotationEffect(.degrees(180))
                .ignoresSafeArea()
        } else {
            BackgroundShape()
                .fill(LinearGradient(colors: [.bg_gradient_green, .bg_gradient_brown], startPoint: .center, endPoint: .bottomTrailing))
                .opacity(0.8)
                .ignoresSafeArea()
        }
        
        
    }
}

struct BackgroundShapeView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundShapeView(isHome: true)
    }
}
