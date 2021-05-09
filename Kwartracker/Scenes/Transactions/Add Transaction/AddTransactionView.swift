//
//  AddTransactionView.swift
//  Kwartracker
//
//  Created by Jacob on 5/9/21.
//

import SwiftUI

enum AddTransactionPageViewType {
    case chooseWalletPage
    case addTransactionForm

    var shouldShowWalletPage: Bool {
        self == .chooseWalletPage
    }

    var shouldShowAddTransactionForm: Bool {
        self == .addTransactionForm
    }
}

struct AddTransactionView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var showTransactionPageType: AddTransactionPageViewType = .chooseWalletPage
    var body: some View {
        ZStack {
            VStack {
                NavigationBarView(
                    title: L10n.TransactionsPage.titleBar) {
                    Button(action: {
                        if showTransactionPageType.shouldShowWalletPage {
                            presentationMode.wrappedValue.dismiss()
                        } else {
                            withAnimation {
                                showTransactionPageType = .chooseWalletPage
                            }
                        }
                    }) {
                        Image(uiImage: Asset.Images.arrowLeftIconWhite.image)
                            .frame(width: 10, height: 10)
                    }
                    .buttonStyle(
                        CircleButtonStyle(buttonColor: Asset.Colors.teal.color)
                    )
                } rightBarViewContent: {
                    Button(action: {
                    }) {
                        Text("Edit")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(Color(Asset.Colors.solitudeGrey.color).opacity(0.5))
                    }
                    .disabled(true)
                }

                ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                    Rectangle()
                        .fill(Color(Asset.Colors.solitudeGrey.color))
                        .cornerRadius(45, corners: [.topLeft, .topRight])
                        .edgesIgnoringSafeArea(.bottom)
                    VStack {
                        Text("Which wallet do you want it to add?")
                        Button("Next", action: {
                            withAnimation {
                                showTransactionPageType = .addTransactionForm
                            }
                        })
                    }
                    .opacity(showTransactionPageType.shouldShowWalletPage ? 1 : 0)

                    VStack {
                        Text("Add transaction form")
                    }
                    .opacity(showTransactionPageType.shouldShowAddTransactionForm ? 1 : 0)
                }
                .padding(.top, 20)
            }
            .padding(.top, 10)
        }
        .background(
            Color(Asset.Colors.teal.color)
                .ignoresSafeArea()
        )
        .navigationBarHidden(true)
        .onAppear {
            showTransactionPageType = .chooseWalletPage
        }
    }
}

struct AddTransactionView_Previews: PreviewProvider {
    static var previews: some View {
        AddTransactionView()
    }
}
