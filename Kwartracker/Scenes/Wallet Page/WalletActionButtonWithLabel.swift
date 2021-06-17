//
//  WalletActionButtonWithLabel.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 5/7/21.
//

import SwiftUI

struct WalletActionButtonWithLabel: View {
    @State private var buttonSize: CGFloat = 10
    @State private var padding: CGFloat = 10
    @State private var fontSize: CGFloat = 12
    @Binding var iconName: String
    @Binding var iconColor: String
    @Binding var label: String
    var body: some View {
        HStack {
            Button(action: {
            }, label: {
                Image(iconName)
                    .renderingMode(.template)
                    .foregroundColor(Color(iconColor))
                    .frame(width: buttonSize, height: buttonSize)
            })
            .buttonStyle(CircleButtonStyle(
                            buttonColor: Asset.Colors.solitudeGrey.color,
                            padding: padding))
            Text(label)
                .font(.system(size: fontSize,
                              weight: .bold))
                .foregroundColor(Color(iconColor))
        }
    }
}
