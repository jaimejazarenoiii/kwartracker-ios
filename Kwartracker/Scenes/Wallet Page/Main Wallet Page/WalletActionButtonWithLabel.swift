//
//  WalletActionButtonWithLabel.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 5/7/21.
//

import SwiftUI

struct WalletActionButtonWithLabel: View {
    @State private var buttonSize: CGFloat = 30
    @State private var padding: CGFloat = 10
    @Binding var iconName: String
    @Binding var iconColor: String
    @Binding var label: String
    @Binding var buttonTap: Bool
    var body: some View {
        HStack {
            Button(action: {
                buttonTap.toggle()
            }, label: {
                Image(iconName)
                    .renderingMode(.template)
                    .foregroundColor(Color(iconColor))
                    .frame(width: 10, height: 10)
            })
            .buttonStyle(CircleButtonStyle(buttonColor: Asset.Colors.solitudeGrey.color, padding: 10))
            Text(label)
                .font(.system(size: 12,
                              weight: .bold))
                .foregroundColor(Color(iconColor))
        }
    }
}
