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
    @State private var addTransactionIcon: String = Asset.Images.addIcon.name
    @State private var addTransactionLabel: String = L10n.Wallet.ActionButton.addTransaction
    var body: some View {
        HStack {
            WalletActionButtonWithLabel(iconName: $editIconName,
                                  iconColor: $iconColor,
                                  label: $editLabel)
            Spacer()
            
            WalletActionButtonWithLabel(iconName: $addTransactionIcon,
                                  iconColor: $iconColor,
                                  label: $addTransactionLabel)
        }
        .frame(width: UIScreen.main.bounds.width * 0.8)
    }
}

struct WalletActionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        WalletActionButtonView()
    }
}

 
