//
//  EditWalletPage.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 6/29/21.
//

import SwiftUI

struct EditWalletPage: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var store: AppStore
    
    @State internal var buttonToggle: Bool = false
    @State internal var cardSize: CGSize = .zero
    @State internal var includeTotalBalanceFlag: Bool = false
    @State internal var currencyMenuPresented: Bool = false
    @State internal var walletTypeMenuPresented: Bool = false
    @State internal var calendarPresented: Bool = false
    @State var transactionFieldType: TransactionFieldType = .dateRange
    
    internal let spacing: CGFloat = 30
    internal let disableOpacityValue: Double = 0.48
    internal let enableOpacityValue: Double = 1
    internal var baseSize: CGSize = CGSize(width: 238, height: 155)
    internal let navIconSize: CGFloat = 10
    internal var isSaveButtonEnabled: Bool {
        return !wallet.title.isEmpty &&
            wallet.currency != nil
    }
    @State internal var wallet: Wallet
    
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
        ZStack {
            MainBody
            OptionAlert
        }.navigationBarHidden(true)
    }
    
    var MainBody: some View {
        SkeletalView {
            NavigationBarView(
                title: L10n.Wallet.ActionButton.editWallet) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(uiImage: Asset.Images.arrowLeftIconWhite.image)
                        .frame(width: navIconSize, height: navIconSize)
                }
                .buttonStyle(
                    CircleButtonStyle(buttonColor: Asset.Colors.teal.color)
                )
            } rightBarViewContent: {
                Button(action: {
                    if isSaveButtonEnabled {
                        store.send(.walletView(action: .edit(wallet: wallet)))
                        if !store.state.walletState.requestState.isRequesting {
                            presentationMode.wrappedValue.dismiss()
                       }
                    }
                }, label: {
                    Text(L10n.Button.Label.save)
                        .foregroundColor(Color(Asset.Colors.solitudeGrey.color)
                                            .opacity(isSaveButtonEnabled ?
                                                        enableOpacityValue :
                                                        disableOpacityValue))
                        .font(.system(size: 16,
                                      weight: .bold))
                }).disabled(!isSaveButtonEnabled)
            }
        } body: {
            ScrollView(showsIndicators: true) {
                VStack {
                    Spacer()
                        .frame(height: spacing)
                    CardView(size: cardSize, wallet: wallet)
                    Spacer()
                        .frame(height: spacing)
                    Fields
                }
            }
            .adaptsToKeyboard()
        }
    }
}
