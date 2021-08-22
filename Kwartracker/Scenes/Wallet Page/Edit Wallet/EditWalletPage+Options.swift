//
//  EditWalletPage+Options.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 6/29/21.
//

import SwiftUI

extension EditWalletPage {
    internal var OptionAlert: some View {
        Group {
            if currencyMenuPresented {
                OptionView(
                    presented: $currencyMenuPresented,
                    selectedItem: $wallet.currencyStr,
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
                CalendarTableView(dateRawString: $wallet.targetRawDate)
                    .background(BackgroundBlurView())
                    .ignoresSafeArea()
                
            }
            
            if walletTypeMenuPresented {
                OptionView(presented: $walletTypeMenuPresented,
                           selectedItem: $wallet.walletTypeStr,
                           options:
                            [OptionItem(description: WalletType.savings.stringValue,
                                        value: WalletType.savings.stringValue)])
                    .background(BackgroundBlurView())
                    .ignoresSafeArea()
            }
        }
    }
}
