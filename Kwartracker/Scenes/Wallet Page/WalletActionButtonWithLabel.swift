//
//  WalletActionButtonWithLabel.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 5/7/21.
//

import SwiftUI

struct WalletActionButtonWithLabel: View {
    @Binding var iconName: String
    @Binding var iconColor: String
    @Binding var label: String
    @Binding var buttonTap: Bool
    private let iconSize: CGFloat = 10
    private let padding: CGFloat = 10
    private let fontSize: CGFloat = 12
    var body: some View {
        HStack {
            Button(action: {
                buttonTap.toggle()
            }, label: {
                Image(iconName)
                    .renderingMode(.template)
                    .foregroundColor(Color(iconColor))
                    .frame(width: iconSize, height: iconSize)
            })
            .buttonStyle(CircleButtonStyle(buttonColor: Asset.Colors.solitudeGrey.color, padding: padding))
            Text(label)
                .font(.system(size: fontSize,
                              weight: .bold))
                .foregroundColor(Color(iconColor))
        }
    }
}
