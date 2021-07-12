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
                            [OptionItem(description: Currency.philippinePeso.rawValue.stringValue,
                                        value: Currency.philippinePeso.rawValue.stringValue),
                             OptionItem(description: Currency.usDollar.rawValue.stringValue,
                                        value: Currency.usDollar.rawValue.stringValue)])
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
                            [OptionItem(description: WalletType.savings.stringValue,
                                        value: WalletType.savings.stringValue)])
                    .background(BackgroundBlurView())
                    .ignoresSafeArea()
            }
        }
    }
}
