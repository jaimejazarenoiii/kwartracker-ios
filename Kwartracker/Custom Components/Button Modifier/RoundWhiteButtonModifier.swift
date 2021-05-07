//
//  RoundWhiteButtonModifier.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 5/7/21.
//

import SwiftUI

struct RoundWhiteButtonStyle: ButtonStyle {
    @Binding var paddingSize: CGFloat
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(paddingSize)
            .background(
                Circle()
                    .fill(Color.white)
                    .shadow(color: Color.black.opacity(0.2),
                        radius: 10, x: 5, y: 5)
                    .shadow(color: Color.white.opacity(0.7),
                        radius: 10, x: -5, y: -5)
        )
    }
}
