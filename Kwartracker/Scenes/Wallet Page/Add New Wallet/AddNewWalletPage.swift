//
//  AddNewWalletPage.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 5/17/21.
//

import SwiftUI

struct AddNewWalletPage: View {
    @State private var buttonToggle: Bool = false
    @State private var cardSize: CGSize = .zero
    @State private var cardName: String = ""
    @State private var cardType: WalletType = .none
    @State private var cardCurrency: String = ""
    @State private var targetAmount: String = ""
    @State private var savedTo: String = ""
    @State private var includeTotalBalanceFlag: Bool = true
    
    private let spacing: CGFloat = 30
    private let disableOpacityValue: Double = 0.48
    private let enableOpacityValue: Double = 1
    private var baseSize: CGSize = CGSize(width: 238, height: 155)
    private var isSaveButtonEnabled: Bool {
        return !cardName.isEmpty &&
            !cardCurrency.isEmpty &&
            !savedTo.isEmpty &&
            cardType != .none
    }
    
    init() {
        let maxWidth: CGFloat = 238
        let calculatedWidth = UIScreen.main.bounds.width * 0.65
        let newWidth = maxWidth < calculatedWidth ? maxWidth : calculatedWidth
        let calculatedHeight = self.setHeightRatio(width: newWidth,
                                                   baseSize: baseSize)
        self._cardSize = State(initialValue: CGSize(width: newWidth,
                                                   height: calculatedHeight))
        
    }
    
    var body: some View {
        SkeletalView {
            KNavigationView(L10n.Wallet.Title.addWallet,
                            destination: AnyView(TransactionsView()),
                            buttonToggle: $buttonToggle) {
                Button(action: {
                    if isSaveButtonEnabled {
                        buttonToggle.toggle()
                    }
                }, label: {
                    Text(L10n.save)
                        .foregroundColor(Color(Asset.Colors.solitudeGrey.color)
                                            .opacity(isSaveButtonEnabled ?
                                                        enableOpacityValue :
                                                        disableOpacityValue))
                        .font(.system(size: 16,
                                      weight: .bold))
                }).disabled(isSaveButtonEnabled)
            }
        } body: {
            ScrollView(showsIndicators: true) {
                VStack {
                    Spacer()
                        .frame(height: spacing)
                    CardView(name: $cardName,
                             type: $cardType,
                             size: cardSize)
                    Spacer()
                        .frame(height: spacing)
                    AddWalletFieldsView(walletNameValue: $cardName,
                                        walletCurrency: $cardCurrency,
                                        walletTypeValue: $cardType,
                                        targetAmountValue: $targetAmount,
                                        savedToValue: $savedTo,
                                        includeTotalBalanceFlag: $includeTotalBalanceFlag)
                }
            }
            .adaptsToKeyboard()
        }
    }
}
