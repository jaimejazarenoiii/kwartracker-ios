//
//  EditWalletPage+Fields.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 6/29/21.
//

import SwiftUI

extension EditWalletPage {
    internal var Fields: some View {
        VStack(alignment: .leading) {
            TextFieldForm(
                label: L10n.Wallet.Label.walletName,
                placeholder: L10n.Wallet.Placeholder.enterWalletName,
                inputValue: $wallet.title
            )
            .accessibilityIdentifier("walletName") // use for ui test
            
            CurrencySelector
            
            WalletTypeSelector

            GoalField

            Spacer()
                .frame(height: spacing)
        }
        .padding([.trailing, .leading, .bottom],
                 UIScreen.main.bounds.width * 0.07)
    }
    
    private var CurrencySelector: some View {
        Group {
            Spacer()
                .frame(height: spacing)
            SelectableFieldForm(
                defaultSelectionType: .currency,
                label: L10n.currency,
                selectLabel: wallet.currency == nil ?
                    L10n.Wallet.Placeholder.selectWalletCurrency :
                    wallet.currency!.rawValue.stringValue ,
                showOptions: $currencyMenuPresented,
                transactionSelection: $transactionFieldType
            )
        }
    }
    
    private var WalletTypeSelector: some View {
        Group {
            Spacer()
                .frame(height: spacing)
            SelectableFieldForm(
                defaultSelectionType: .walletType,
                label: L10n.Wallet.Label.walletType,
                selectLabel: wallet.type == .none ?
                    L10n.Wallet.Placeholder.selectWalletType :
                    wallet.type.stringValue,
                showOptions: $walletTypeMenuPresented,
                transactionSelection: $transactionFieldType
            )
        }
    }

    private var GoalField: some View {
        Group {
            if wallet.type != .none {
                if wallet.currency != nil {
                    if wallet.type == .goal {
                    Spacer()
                        .frame(height: spacing)
                    SelectableFieldForm(
                        defaultSelectionType: .calendar,
                        label: L10n.Wallet.Label.targetDate,
                        selectLabel: wallet.targetRawDate.isEmpty ?
                            L10n.Wallet.Placeholder.targetDate :
                            wallet.targetRawDate,
                        showOptions: $calendarPresented,
                        transactionSelection: $transactionFieldType
                    )
                }
                
                // not included in API yet
//                Spacer()
//                    .frame(height: spacing)
//                TextFieldForm(
//                    label: "L10n.Wallet.Label.savedTo",
//                    placeholder: "L10n.Wallet.Label.savedTo",
//                    inputValue: $savedToValue
//                )
//            }
                }
            }
        }
    }
}
