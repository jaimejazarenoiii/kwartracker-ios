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

struct WalletActionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        WalletActionButtonView()
    }
}

 
