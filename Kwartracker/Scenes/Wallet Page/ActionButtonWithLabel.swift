//
//  ActionButtonWithLabel.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 5/7/21.
//

import SwiftUI

struct ActionButtonWithLabel: View {
    @State private var buttonSize: CGFloat = 30
    @State private var padding: CGFloat = 10
    @Binding var iconName: String
    @Binding var iconColor: String
    @Binding var label: String
    var body: some View {
        HStack {
            Button(action: {
            }) {
                Image(iconName)
                    .renderingMode(.template)
                    .foregroundColor(Color(iconColor))
            }
            .frame(width: buttonSize)
            .buttonStyle(RoundWhiteButtonStyle(paddingSize: $padding))
            Text(label)
                .font(.system(size: 12,
                              weight: .bold))
                .foregroundColor(Color(iconColor))
        }
    }
}
