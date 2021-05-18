//
//  TealRoundedRectangleButtonStyle.swift
//  Kwartracker
//
//  Created by Jacob on 4/25/21.
//

import SwiftUI

struct RoundedRectangleButtonStyle: ButtonStyle {
    let fillColor: UIColor

    private let defaultPadding: CGFloat = 15
    private let cornerRadius: CGFloat = 15
    private let strokeLineWidth: CGFloat = 4
    private let shadowRadius: CGFloat = 8
    private let blackOpacity: Double = 0.2
    private let whiteOpacity: Double = 0.7

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(defaultPadding)
            .contentShape(RoundedRectangle(cornerRadius: cornerRadius))
            .background(
                Group {
                    if configuration.isPressed {
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .fill(Color(fillColor))
                            .overlay(
                                RoundedRectangle(cornerRadius: cornerRadius)
                                    .stroke(Color.gray, lineWidth: strokeLineWidth)
                                    .blur(radius: cornerRadius)
                                    .offset(x: strokeLineWidth / 2, y: strokeLineWidth / 2)
                                    .mask(RoundedRectangle(cornerRadius: cornerRadius)
                                            .fill(LinearGradient(.black, .clear))
                                    )
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: cornerRadius)
                                    .stroke(Color(fillColor), lineWidth: strokeLineWidth)
                                    .blur(radius: cornerRadius)
                                    .offset(x: -(strokeLineWidth / 2), y: -(strokeLineWidth / 2))
                                    .mask(RoundedRectangle(cornerRadius: cornerRadius)
                                            .fill(LinearGradient(.clear, .black))
                                    )
                            )
                    } else {
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .fill(Color(fillColor))
                            .shadow(
                                color: Color.black.opacity(blackOpacity),
                                radius: shadowRadius,
                                x: shadowRadius,
                                y: shadowRadius
                            )
                            .shadow(
                                color: Color.white.opacity(whiteOpacity),
                                radius: shadowRadius,
                                x: -(shadowRadius / 2),
                                y: -(shadowRadius / 2)
                            )
                    }
                }
            )
    }
}
