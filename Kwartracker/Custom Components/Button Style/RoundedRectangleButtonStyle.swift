//
//  RoundedRectangleButtonStyle.swift
//  Kwartracker
//
//  Created by Jacob on 5/8/21.
//

import SwiftUI

struct RoundedRectangleButtonStyle: ButtonStyle {
    var buttonColor: UIColor
    var padding: CGFloat = 15
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(padding)
            .contentShape(RoundedRectangle(cornerRadius: 16))
            .background(
                Group {
                    if configuration.isPressed {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color(buttonColor))
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.gray, lineWidth: 4)
                                    .blur(radius: 4)
                                    .offset(x: 2, y: 2)
                                    .mask(RoundedRectangle(cornerRadius: 16).fill(LinearGradient(.black, .clear)))
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color(buttonColor), lineWidth: 8)
                                    .blur(radius: 4)
                                    .offset(x: -2, y: -2)
                                    .mask(Circle().fill(LinearGradient(.clear, .black)))
                            )
                    } else {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color(buttonColor))
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                    }
                }
            )
    }
}
