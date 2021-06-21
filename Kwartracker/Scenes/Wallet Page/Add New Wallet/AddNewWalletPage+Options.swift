//
//  AddNewWalletPage+Options.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 6/18/21.
//

import SwiftUI

extension AddNewWalletPage {
    internal var OptionAlert: some View {
        Group {
            if currencyMenuPresented {
                OptionView(presented: $currencyMenuPresented,
                           selectedItem: $walletCurrency,
                           options:
                            [OptionItem(description: Currency.philippinePeso.stringValue,
                                        value: Currency.philippinePeso.localeNumberFormat),
                             OptionItem(description: Currency.usDollar.stringValue,
                                        value: Currency.usDollar.localeNumberFormat)])
                    .background(BackgroundBlurView())
                    .ignoresSafeArea()
                    .transition(.opacity)
                    .animation(.easeIn)
                
            }
            if calendarPresented {
                CalendarTableView(dateRawString: $targetDateStr)
                    .background(BackgroundBlurView())
                    .ignoresSafeArea()
                
            }
            
            if walletTypeMenuPresented {
                OptionView(presented: $walletTypeMenuPresented,
                           selectedItem: $walletTypeValue,
                           options:
                            [OptionItem(description: WalletType.budget.stringValue,
                                        value: WalletType.budget.stringValue),
                             OptionItem(description: WalletType.savings.stringValue,
                                        value: WalletType.savings.stringValue),
                             OptionItem(description: WalletType.goal.stringValue,
                                        value: WalletType.goal.stringValue)])
                    .background(BackgroundBlurView())
                    .ignoresSafeArea()
            }
        }
    }
}
