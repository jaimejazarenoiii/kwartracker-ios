//
//  AddWalletFieldsView.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 5/18/21.
//

import SwiftUI

struct AddWalletFieldsView: View {
    @Binding var walletNameValue: String
    @Binding var walletCurrency: Currency?
    @Binding var walletTypeValue: WalletType
    @Binding var savedToValue: String
    @Binding var includeTotalBalanceFlag: Bool
    @State private var walletTypeMenuPresenting: Bool = false
    @State private var currencyMenuPresenting: Bool = false
    private let spacing: CGFloat = 30

    var body: some View {
        VStack(alignment: .leading) {
            KTextfield(textValue: $walletNameValue,
                       textLabel: L10n.Wallet.Label.walletType,
                       textPlaceHolder: L10n.Wallet.Placeholder.enterWalletName)
                .accessibilityIdentifier("walletName") // use for ui test
            Spacer()
                .frame(height: spacing)
            
            SelectableFieldForm(
                menuPresenting: $currencyMenuPresenting,
                label: L10n.currency,
                selectLabel: walletCurrency == nil ?
                    L10n.Wallet.Placeholder.selectWalletCurrency : walletCurrency!.rawValue
            )
            .actionSheet(isPresented: $currencyMenuPresenting) {
                ActionSheet(
                    title: Text(L10n.currency.capitalized), buttons: [
                        .default(Text(Currency.usDollar.rawValue)) {
                            self.walletCurrency = Currency.usDollar
                        },
                        .default(Text(Currency.philippinePeso.rawValue)) {
                            self.walletCurrency = Currency.philippinePeso
                        },
                        .cancel()
                ])
            }
            
            Spacer()
                .frame(height: spacing)
            
            // not final. used for testing only
            SelectableFieldForm(
                menuPresenting: $walletTypeMenuPresenting,
                label: L10n.Wallet.Label.walletType,
                selectLabel: walletTypeValue == .none ?
                    L10n.Wallet.Placeholder.selectWalletType : walletTypeValue.stringValue
            )
            .actionSheet(isPresented: $walletTypeMenuPresenting) {
                ActionSheet(
                    title: Text(L10n.Wallet.Label.walletType), buttons: [
                        .default(Text(WalletType.savings.stringValue)) {
                            self.walletTypeValue = .savings
                        },
                        .default(Text(WalletType.budget.stringValue)) {
                            self.walletTypeValue = .budget
                        },
                        .cancel()
                ])
            }
            
            Spacer()
                .frame(height: spacing)
            
            if walletTypeValue != .none {
                KTextfield(textValue: $savedToValue,
                           textLabel: L10n.savedTo,
                           textPlaceHolder: L10n.savedTo)
            }
            
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
                            walletCurrency: Binding.constant(nil),
                            walletTypeValue: Binding.constant(WalletType.none),
                            savedToValue: Binding.constant(""),
                            includeTotalBalanceFlag: Binding.constant(true))
    }
}
