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
    private let loaderSize: CGFloat = 200
    var navigationBackAction: (() -> Void)
    var body: some View {
        NavigationView {
            SkeletalView {
                NavigationBarView(
                    title: L10n.Wallet.Title.myWallet) {
                    Button(action: navigationBackAction) {
                        Image(uiImage: Asset.Images.arrowLeftIconWhite.image)
                            .frame(width: navIconSize, height: navIconSize)
                    }
                    .buttonStyle(
                        CircleButtonStyle(buttonColor: Asset.Colors.teal.color)
                    )
                } rightBarViewContent: {
                    NavigationLink(
                        destination: AddNewWalletPage()
                            .environmentObject(store),
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
                if store.state.walletState.requestState.isRequesting {
                    ActivityIndicator()
                        .frame(width: loaderSize, height: loaderSize)
                        .foregroundColor(Color(Asset.Colors.teal.color))
                } else {
                    ScrollView(showsIndicators: true) {
                        VStack {
                            WalletCardView(wallets: store.state.walletState.wallets) { transactions in
                                Spacer()
                                    .frame(height: margin)

                                WalletSectionHeader()

                                Spacer()
                                    .frame(height: margin)
                                ForEach(transactions, id: \.id) {
                                    TransactionRow(transaction: $0)
                                    Rectangle()
                                        .fill(Color(separator))
                                        .frame(height: separatorHeight)
                                }
                                .frame(width: UIScreen.main.bounds.width * 0.8)
                            }
                            .environmentObject(store)
                        }
                        .padding(.top, margin)
                    }.background(Color(Asset.Colors.solitudeGrey.color))
                }
            }
            .navigationBarHidden(true)
        }
    }
}
