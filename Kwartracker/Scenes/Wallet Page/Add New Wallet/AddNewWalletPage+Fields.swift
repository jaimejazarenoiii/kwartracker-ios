//
//  AddNewWalletPage+Fields.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 6/18/21.
//

import SwiftUI

extension AddNewWalletPage {
    internal var Fields: some View {
        VStack(alignment: .leading) {
            TextFieldForm(
                label: L10n.Wallet.Label.walletName,
                placeholder: L10n.Wallet.Placeholder.enterWalletName,
                inputValue: $walletNameValue
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
                selectLabel: walletCurrency == nil ?
                    L10n.Wallet.Placeholder.selectWalletCurrency :
                    Currency(stringValue: walletCurrency!)!.rawValue.stringValue,
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
                selectLabel: walletTypeValue == nil ?
                    L10n.Wallet.Placeholder.selectWalletType :
                    walletTypeValue!,
                showOptions: $walletTypeMenuPresented,
                transactionSelection: $transactionFieldType
            )
        }
    }

    private var GoalField: some View {
        Group {
            if walletTypeValue != nil {
                    if walletCurrency != nil {
                        Spacer()
                            .frame(height: spacing)
                        TextFieldForm(
                            label: L10n.Wallet.Label.amount,
                            placeholder: L10n.Wallet.Placeholder.enterYourInitialAmount,
                            inputValue: $targetAmountValue
                        )
                    }
                if walletTypeValue == WalletType.goal.stringValue {
                    Spacer()
                        .frame(height: spacing)
                    SelectableFieldForm(
                        defaultSelectionType: .calendar,
                        label: L10n.Wallet.Label.targetDate,
                        selectLabel: targetDateStr.isEmpty ?
                            L10n.Wallet.Placeholder.targetDate :
                            targetDateStr,
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
            }
        }
    }
}
