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
    @Binding var walletTypeValue: WalletType
    @Binding var targetAmountValue: String
    @Binding var savedToValue: String
    @Binding var includeTotalBalanceFlag: Bool
    @State private var walletTypeMenuPresenting: Bool = false
    @State private var currencyMenuPresenting: Bool = false
    @State private var calendarPresenting: Bool = false
    private let spacing: CGFloat = 30

    var body: some View {
        VStack(alignment: .leading) {
            KTextfield(textValue: $walletNameValue,
                       textLabel: L10n.Wallet.Label.walletType,
                       textPlaceHolder: L10n.Wallet.Placeholder.enterWalletName)
                .accessibilityIdentifier("walletName") // use for ui test
            
            CurrencySelector
            
            WalletTypeSelector
            
            GoalField
            
            Spacer()
                .frame(height: spacing)
            
            KToggleView(isActive: $includeTotalBalanceFlag,
                        headerLabel: L10n.Wallet.Label.includeOverallTotalBalance,
                        leftLabel: L10n.yes.uppercased(),
                        rightLabel: L10n.no.uppercased())
        }
        .padding([.trailing, .leading, .bottom],
                 UIScreen.main.bounds.width * 0.07)
    }
    
    private var CurrencySelector: some View {
        Group {
            Spacer()
                .frame(height: spacing)
            
            SelectableFieldForm(
                menuPresenting: $currencyMenuPresenting,
                label: L10n.currency,
                selectLabel: walletCurrency.isEmpty ?
                    L10n.Wallet.Placeholder.selectWalletCurrency : walletCurrency
            )
            .actionSheet(isPresented: $currencyMenuPresenting) {
                ActionSheet(
                    title: Text(L10n.currency.capitalized), buttons: [
                        .default(Text(Currency.usDollar.rawValue)) {
                            self.walletCurrency = Currency.usDollar.rawValue
                        },
                        .default(Text(Currency.philippinePeso.rawValue)) {
                            self.walletCurrency = Currency.philippinePeso.rawValue
                        },
                        .cancel()
                ])
            }
        }
    }
    
    private var WalletTypeSelector: some View {
        Group {
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
                        .default(Text(WalletType.goal.stringValue)) {
                            self.walletTypeValue = .goal
                        },
                        .cancel()
                ])
            }
        }
    }
    
    private var GoalField: some View {
        Group {
            Spacer()
                .frame(height: spacing)
            
            if walletTypeValue != .none {
                KTextfield(textValue: $savedToValue,
                           textLabel: L10n.savedTo,
                           textPlaceHolder: L10n.savedTo)
                
                if walletTypeValue == .goal {
                    
                    Spacer()
                        .frame(height: spacing)
                    
                    KTextfield(textValue: $targetAmountValue,
                               textLabel: L10n.Wallet.Label.targetAmount,
                               textPlaceHolder: L10n.Wallet.Placeholder.enterYourTargetAmount
                    )
                    
                    Spacer()
                        .frame(height: spacing)
                    
                    if !walletCurrency.isEmpty {
                        SelectableFieldForm(
                            menuPresenting: $calendarPresenting,
                            label: L10n.Wallet.Label.targetAmount,
                            selectLabel: L10n.Wallet.Placeholder.targetDate
                        )
                    }
                }
            }
        }
    }
}
