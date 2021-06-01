//
//  NeumorphicEffect.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 5/28/21.
//

import SwiftUI

struct NeumorphicEffect: View {
    var rectSize: CGSize
    var cornerRadius: CGFloat = 20
    private let backgroundColor: Color = Color(Asset.Colors.solitudeGrey.color)
    private let shadowOffset = CGPoint(x: 6, y: 6)
    private let blackOpacity: Double = 0.15
    private let position: CGFloat = 10
    private let shadowRadius: CGFloat = 5
    private let blurRadius: CGFloat = 15
    private let opacity: Double = 0.9
    
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
        .shadow(color: Color.white, radius: shadowRadius,
                x: -shadowOffset.x, y: -shadowOffset.y)
        .shadow(color: Color.black.opacity(blackOpacity),
                radius: shadowRadius, x: shadowOffset.x,
                y: shadowOffset.y)
    }
}

struct NeumorphicEffect_Previews: PreviewProvider {
    static var previews: some View {
        NeumorphicEffect(rectSize: CGSize(width: 100, height: 100))
    }
}
