//
//  EditWalletPage.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 5/21/21.
//

import SwiftUI

struct EditWalletPage: View {
    @State private var buttonToggle: Bool = false
    @State private var cardSize: CGSize = .zero
    @State private var includeTotalBalanceFlag: Bool = true
    
    private let spacing: CGFloat = 30
    private let disableOpacityValue: Double = 0.48
    private let enableOpacityValue: Double = 1
    private var baseSize: CGSize = CGSize(width: 238, height: 155)
    @State private var wallet: Wallet
    
    init(wallet: Wallet) {
        self._wallet = State(initialValue: wallet)
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
                    if wallet.isAllowedToSave {
                        buttonToggle.toggle()
                    }
                }, label: {
                    Text(L10n.save)
                        .foregroundColor(Color(Asset.Colors.solitudeGrey.color)
                                            .opacity(wallet.isAllowedToSave ?
                                                        enableOpacityValue :
                                                        disableOpacityValue))
                        .font(.system(size: 16,
                                      weight: .bold))
                }).disabled(wallet.isAllowedToSave)
            }
        } body: {
            ScrollView(showsIndicators: true) {
                VStack {
                    Spacer()
                        .frame(height: spacing)
                    CardView(size: cardSize, wallet: wallet)
                    Spacer()
                        .frame(height: spacing)
                    AddWalletFieldsView(walletNameValue: $wallet.title,
                                        walletCurrency: $wallet.currency,
                                        walletTypeValue: $wallet.type,
                                        savedToValue: $wallet.savedTo,
                                        includeTotalBalanceFlag: $wallet.includeToOverallTotalBalance)
                }
            }
            .adaptsToKeyboard()
        }
    }
}
