//
//  AddWalletFieldsView.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 5/18/21.
//

import SwiftUI

struct AddWalletFieldsView: View {
    @Binding var walletNameValue: String
    @Binding var walletCurrency: String
    @Binding var walletTypeValue: String
    @Binding var includeTotalBalanceFlag: Bool
    private let spacing: CGFloat = 30

    var body: some View {
        VStack(alignment: .leading) {
            KTextfield(textValue: $walletNameValue,
                       textLabel: L10n.Wallet.Label.walletType,
                       textPlaceHolder: L10n.Wallet.Placeholder.enterWalletName)
            Spacer()
                .frame(height: spacing)
            
            SelectableFieldForm(
                    label: L10n.currency,
                    selectLabel: L10n.Wallet.Placeholder.selectWalletCurrency
                )
            
            Spacer()
                .frame(height: spacing)
            
            SelectableFieldForm(
                    label: L10n.Wallet.Label.walletType,
                    selectLabel: L10n.Wallet.Placeholder.selectWalletType
                )
            
            Spacer()
                .frame(height: spacing)
            
            KToggleView(isActive: $includeTotalBalanceFlag,
                        headerLabel: L10n.Wallet.Label.includeOverallTotalBalance,
                        leftLabel: L10n.yes.uppercased(),
                        rightLabel: L10n.no.uppercased())
        }
        .padding([.trailing, .leading],
                 UIScreen.main.bounds.width * 0.07)
    }
}

struct AddWalletFieldsView_Previews: PreviewProvider {
    static var previews: some View {
        AddWalletFieldsView(walletNameValue: Binding.constant(""),
                            walletCurrency: Binding.constant(""),
                            walletTypeValue: Binding.constant(""),
                            includeTotalBalanceFlag: Binding.constant(true))
    }
}
