//
//  NeumorphicEffect.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 5/14/21.
//

import SwiftUI
struct NeumorphicEffect: View {
    var rectSize: CGSize
    var cornerRadius: CGFloat = 20
    let backgroundColor: Color = Color(Asset.Colors.solitudeGrey.color)
    let shadowOffset = CGPoint(x: 6, y: 6)
    let blackOpacity: Double = 0.15
    let position: CGFloat = 10
    let shadowRadius: CGFloat = 5
    let blurRadius: CGFloat = 15
    let opacity: Double = 0.9
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(backgroundColor)
                    .frame(width: rectSize.width,
                           height: rectSize.height)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(backgroundColor)
                    .frame(width: rectSize.width * 0.9,
                           height: rectSize.height * 0.9)
                    .blur(radius: blurRadius)
                    .opacity(opacity)
                    .shadow(color: Color(Asset.Colors.spindleGrey.color).opacity(blackOpacity),
                            radius: shadowRadius, x: -position, y: -position)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(backgroundColor)
                    .frame(width: rectSize.width * 0.9,
                           height: rectSize.height * 0.9)
                    .blur(radius: blurRadius)
                    .opacity(opacity)
                    .shadow(color: Color.white, radius: shadowRadius,
                            x: position, y: position)
            }
            .mask(
                RoundedRectangle(cornerRadius: cornerRadius)
            )

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .shadow(color: Color.white, radius: shadowRadius,
                x: -shadowOffset.x, y: -shadowOffset.y)
        .shadow(color: Color.black.opacity(blackOpacity),
                radius: shadowRadius, x: shadowOffset.x,
                y: shadowOffset.y)
    }
}
