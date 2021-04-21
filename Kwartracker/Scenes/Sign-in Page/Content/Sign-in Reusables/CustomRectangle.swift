//
//  CustomRectangle.swift
//  Kwartracker
//
//  Created by John Ellie Go on 4/21/21.
//

import SwiftUI

struct RoundedCornerRectangle: View {
    let radius: CGFloat
    let corner: UIRectCorner
    
    var body: some View {
        Rectangle()
            .fill(Color(Asset.Colors.solitudeGrey.color))
            .cornerRadius(radius, corners: corner)
            .edgesIgnoringSafeArea(.bottom)
    }
}

struct BWNeumorphicRectangle: View {
    let rectRadius: CGFloat
    let color: Color
    let shadowRadius: CGFloat
    let shadowOffset: CGPoint
    let height: CGFloat = 48
    
    var body: some View {
        RoundedRectangle(cornerRadius: rectRadius)
            .fill(color)
            .frame(height: height)
            .shadow(color: Color.white, radius: shadowRadius, x: -shadowOffset.x, y: -shadowOffset.y)
            .shadow(color: Color.black.opacity(0.2), radius: shadowRadius, x: shadowOffset.x, y: shadowOffset.y)
    }
}
