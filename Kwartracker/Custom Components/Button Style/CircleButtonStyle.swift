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
                                    .stroke(Color.gray, lineWidth: 4)
                                    .blur(radius: 4)
                                    .offset(x: 2, y: 2)
                                    .mask(Circle().fill(LinearGradient(.black, .clear)))
                            )
                            .overlay(
                                Circle()
                                    .stroke(Color(buttonColor), lineWidth: 8)
                                    .blur(radius: 4)
                                    .offset(x: -2, y: -2)
                                    .mask(Circle().fill(LinearGradient(.clear, .black)))
                            )
                    } else {
                        Circle()
                            .fill(Color(buttonColor))
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                    }
                }
            )
    }
}
