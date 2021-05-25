//
//  CircleButtonStyle.swift
//  Kwartracker
//
//  Created by Jacob on 4/16/21.
//

import SwiftUI

struct CircleButtonStyle: ButtonStyle {
    var buttonColor: UIColor
    var padding: CGFloat = 15

    private let lineWidth: CGFloat = 4
    private let blurRadius: CGFloat = 4
    private let blurOffset = CGPoint(x: 2, y: 2)
    private let blackOpacity: Double = 0.2
    private let blackShadowRadius: CGFloat = 10
    private let blackShadowOffset = CGPoint(x: 10, y: 10)
    private let whiteOpacity: Double = 0.7
    private let whiteShadowRadius: CGFloat = 10
    private let whiteShadowOffset = CGPoint(x: -5, y: -5)

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(padding)
            .contentShape(Circle())
            .background(
                Group {
                    if configuration.isPressed {
                        Circle()
                            .fill(Color(buttonColor))
                            .overlay(
                                Circle()
                                    .stroke(Color.gray, lineWidth: lineWidth)
                                    .blur(radius: blurRadius)
                                    .offset(x: blurOffset.x, y: blurOffset.y)
                                    .mask(Circle().fill(LinearGradient(.black, .clear)))
                            )
                            .overlay(
                                Circle()
                                    .stroke(Color(buttonColor), lineWidth: lineWidth)
                                    .blur(radius: blurRadius)
                                    .offset(x: -(blurOffset.x), y: -(blurOffset.y))
                                    .mask(Circle().fill(LinearGradient(.clear, .black)))
                            )
                    } else {
                        Circle()
                            .fill(Color(buttonColor))
                            .shadow(
                                color: Color.black.opacity(blackOpacity),
                                radius: blackShadowRadius,
                                x: blackShadowOffset.x,
                                y: blackShadowOffset.y
                            )
                            .shadow(
                                color: Color.white.opacity(whiteOpacity),
                                radius: whiteShadowRadius,
                                x: whiteShadowOffset.x,
                                y: whiteShadowOffset.y
                            )
                    }
                }
            )
    }
}
