//
//  WalletActionButtonView.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 4/27/21.
//

import SwiftUI

struct WalletActionButtonView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var iconColor: String = Asset.Colors.spindleGrey.name
    @State private var editIconName: String = Asset.Images.editIcon.name
    @State private var editLabel: String = L10n.Wallet.ActionButton.editWallet
    @State private var addTransactionIcon: String = Asset.Images.addIcon.name
    @State private var addTransactionLabel: String = L10n.Wallet.ActionButton.addTransaction
    @State private var editWalletTap: Bool = false
    @State private var addTransactionTap: Bool = false
    var wallet: Wallet
    
    var body: some View {
        HStack {
            NavigationLink(
                destination: AnyView(TransactionsView()), // will edit to edit wallet
                isActive: $editWalletTap) {
                WalletActionButtonWithLabel(iconName: $editIconName,
                                      iconColor: $iconColor,
                                      label: $editLabel,
                                      buttonTap: $editWalletTap)
            }.navigationBarHidden(true)
            Spacer()
            
            WalletActionButtonWithLabel(iconName: $addTransactionIcon,
                                  iconColor: $iconColor,
                                  label: $addTransactionLabel,
                                  buttonTap: $addTransactionTap)
        }
        .frame(width: UIScreen.main.bounds.width * 0.8)
    }
}

 
