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
    @State private var buttonToggle: Bool = false
    private let separator: UIColor = Asset.Colors.spindleGrey.color
    private let separatorHeight: CGFloat = 0.5
    private let navIconSize: CGFloat = 10
    var body: some View {
        SkeletalView {
            NavigationBarView(
                title: L10n.Wallet.Title.myWallet) {
                Button(action: {
                }) {
                    Image(uiImage: Asset.Images.arrowLeftIconWhite.image)
                        .frame(width: navIconSize, height: navIconSize)
                }
                .buttonStyle(
                    CircleButtonStyle(buttonColor: Asset.Colors.teal.color)
                )
            } rightBarViewContent: {
                
                NavigationLink(
                    destination: TransactionsView(),
                    isActive: $buttonToggle) {
                    
                    Button(action: {
                        buttonToggle.toggle()
                    }, label: {
                        Image(uiImage: Asset.Images.addIcon.image)
                            .renderingMode(.template)
                            .foregroundColor(Color(Asset.Colors.teal.color))
                            .frame(width: navIconSize, height: navIconSize)
                    })
                    .buttonStyle(CircleButtonStyle(buttonColor: .white))
                }
            }
        } body: {
            ScrollView(showsIndicators: true) {
                VStack {
                    WalletOneCardCenterView(wallets: store.state.walletState.wallets)
                    
                    Spacer()
                        .frame(height: margin)
                    
                    WalletSectionHeader()
                    
                    Spacer()
                        .frame(height: margin)
                    ForEach(store.state.transactionState.transactions, id: \.id) {
                        TransactionRow(transaction: $0)
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
