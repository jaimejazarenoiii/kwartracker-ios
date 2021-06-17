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
    @Binding var targetAmountValue: String
    @Binding var savedToValue: String
    @Binding var targetDateStr: String
    @Binding var includeTotalBalanceFlag: Bool
    @State private var menuPresenting: Bool = false
    @State var transactionFieldType: TransactionFieldType = .dateRange
    private let spacing: CGFloat = 30

    var body: some View {
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
            
//            KToggleView(isActive: $includeTotalBalanceFlag,
//                        headerLabel: L10n.Wallet.Label.includeOverallTotalBalance,
//                        leftLabel: L10n.yes.uppercased(),
//                        rightLabel: L10n.no.uppercased())
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
                    walletCurrency!.localeNumberFormat,
                showOptions: $menuPresenting,
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
                selectLabel: walletTypeValue == .none ?
                    L10n.Wallet.Placeholder.selectWalletType :
                    walletTypeValue.stringValue,
                showOptions: $menuPresenting,
                transactionSelection: $transactionFieldType
            )
        }
    }

    private var GoalField: some View {
        Group {
            if walletTypeValue != .none {
                if walletTypeValue == .goal {
                    if walletCurrency != nil {
                        Spacer()
                            .frame(height: spacing)
                        TextFieldForm(
                            label: L10n.Wallet.Label.targetAmount,
                            placeholder: L10n.Wallet.Placeholder.enterYourTargetAmount,
                            inputValue: $targetAmountValue
                        )
                    }

                    Spacer()
                        .frame(height: spacing)
                    SelectableFieldForm(
                        defaultSelectionType: .calendar,
                        label: L10n.Wallet.Label.targetDate,
                        selectLabel: targetDateStr.isEmpty ?
                            L10n.Wallet.Placeholder.targetDate :
                            targetDateStr,
                        showOptions: $menuPresenting,
                        transactionSelection: $transactionFieldType
                    )
                }
                Spacer()
                    .frame(height: spacing)
                TextFieldForm(
                    label: L10n.Wallet.Label.savedTo,
                    placeholder: L10n.Wallet.Label.savedTo,
                    inputValue: $savedToValue
                )
            }
        }
    }
}
