//
//  WalletPageView.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 4/20/21.
//

import SwiftUI

struct WalletPageView: View {
    @EnvironmentObject var store: AppStore
    @State private var margin: CGFloat = 30
    private var separator: UIColor = Asset.Colors.spindleGrey.color
    private var separatorHeight: CGFloat = 0.5
    var body: some View {
        AuthLayoutView {
            WalletNavigationView(navigationTitle: L10n.Wallet.Title.myWallet)
        } content: {
            ScrollView(showsIndicators: true) {
                VStack {
                    WalletOneCardCenterView()
                    
                    Spacer()
                        .frame(height: margin)
                    
                    WalletSectionHeader()
                    
                    Spacer()
                        .frame(height: margin)
                    ForEach(store.state.transactionState.transactions, id: \.id) {
                        TransactionRowContent(transaction: $0)
                        Rectangle()
                            .fill(Color(separator))
                            .frame(height: separatorHeight)
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.8)
                }
                .padding(.top, margin)
            }.background(Color(Asset.Colors.solitudeGrey.color))
        }
    }
}
