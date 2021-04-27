//
//  WalletActionButtonView.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 4/27/21.
//

import SwiftUI

struct WalletActionButtonView: View {
    @State private var iconColor: String = Asset.Colors.spindleGrey.name
    @State private var editIconName: String = Asset.Images.editIcon.name
    @State private var editLabel: String = L10n.Wallet.ActionButton.editWallet
    @State private var addTransactionIcon: String = Asset.Images.editIcon.name
    @State private var addTransactionLabel: String = L10n.Wallet.ActionButton.addTransaction
    var body: some View {
        HStack {
            ActionButtonWithLabel(iconName: $editIconName,
                                  iconColor: $iconColor,
                                  label: $editLabel)
            Spacer()
            
            ActionButtonWithLabel(iconName: $addTransactionIcon,
                                  iconColor: $iconColor,
                                  label: $addTransactionLabel)
        }
        .padding([.trailing, .leading], UIScreen.main.bounds.width / 8)
    }
}

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

struct WalletActionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        WalletActionButtonView()
    }
}

 
