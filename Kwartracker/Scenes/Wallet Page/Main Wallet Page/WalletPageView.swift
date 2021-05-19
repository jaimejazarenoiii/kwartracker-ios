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
    private let headerIconSize: CGFloat = 10
    var body: some View {
        NavigationView {
            AuthLayoutView {
                KNavigationView(L10n.Wallet.Title.myWallet,
                                destination: AnyView(AddNewWalletPage()),
                                buttonToggle: $buttonToggle) {
                    Button(action: {
                        buttonToggle.toggle()
                    }, label: {
                        Image(uiImage: Asset.Images.addIconTeal.image)
                            .frame(width: headerIconSize, height: headerIconSize)
                    })
                    .buttonStyle(CircleButtonStyle(buttonColor: .white))
                    .accessibility(identifier: "addNewWallet") // use for ui testing
                }
            } content: {
                ScrollView(showsIndicators: true) {
                    VStack {
                        WalletOneCardCenterView(wallets: store.state.walletState.wallets)
                        
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
        .navigationBarHidden(true)
        .modifier(DismissingKeyboard())
    }
}
