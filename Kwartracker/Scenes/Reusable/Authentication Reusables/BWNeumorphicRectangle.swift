//
//  CustomRectangle.swift
//  Kwartracker
//
//  Created by John Ellie Go on 4/21/21.
//

import SwiftUI

struct BWNeumorphicRectangle: View {
    let rectRadius: CGFloat
    let color: Color
    let shadowRadius: CGFloat
    let shadowOffset: CGPoint
    let height: CGFloat = 48
    let blackOpacity: Double = 0.15
    
    var body: some View {
        RoundedRectangle(cornerRadius: rectRadius)
            .fill(color)
            .frame(height: height)
            .shadow(color: Color.white, radius: shadowRadius, x: -shadowOffset.x, y: -shadowOffset.y)
            .shadow(color: Color.black.opacity(blackOpacity),
                    radius: shadowRadius, x: shadowOffset.x, y: shadowOffset.y)
    }
}
