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
    var body: some View {
        VStack {
            KTextfield(textValue: $walletNameValue,
                       textLabel: L10n.Wallet.Label.walletType,
                       textPlaceHolder: L10n.Wallet.Placeholder.enterWalletName)
            
            KTextfield(textValue: $walletCurrency,
                       textLabel: L10n.currency,
                       textPlaceHolder: L10n.Wallet.Placeholder.selectWalletCurrency)
            
            KTextfield(textValue: $walletTypeValue,
                       textLabel: L10n.Wallet.Label.walletType,
                       textPlaceHolder: L10n.Wallet.Placeholder.selectWalletType)
        }
    }
}

struct AddWalletFieldsView_Previews: PreviewProvider {
    static var previews: some View {
        AddWalletFieldsView(walletNameValue: Binding.constant(""),
                            walletCurrency: Binding.constant(""),
                            walletTypeValue: Binding.constant(""))
    }
}
