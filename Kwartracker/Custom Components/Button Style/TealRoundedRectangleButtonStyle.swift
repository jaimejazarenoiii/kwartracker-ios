//
//  TealRoundedRectangleButtonStyle.swift
//  Kwartracker
//
//  Created by Jacob on 4/25/21.
//

import SwiftUI

struct TealRoundedRectangleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(15)
            .contentShape(RoundedRectangle(cornerRadius: 15))
            .background(
                Group {
                    if configuration.isPressed {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color(Asset.Colors.teal.color))
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray, lineWidth: 4)
                                    .blur(radius: 4)
                                    .offset(x: 2, y: 2)
                                    .mask(RoundedRectangle(cornerRadius: 8).fill(LinearGradient(.black, .clear)))
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color(Asset.Colors.teal.color), lineWidth: 8)
                                    .blur(radius: 4)
                                    .offset(x: -2, y: -2)
                                    .mask(RoundedRectangle(cornerRadius: 8).fill(LinearGradient(.clear, .black)))
                            )
                    } else {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color(Asset.Colors.teal.color))
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                    }
                }
            )
    }
}
