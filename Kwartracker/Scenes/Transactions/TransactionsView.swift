//
//  TransactionsView.swift
//  Kwartracker
//
//  Created by Jacob on 4/16/21.
//

import SwiftUI

struct TransactionsView: View {
    @EnvironmentObject var store: AppStore
    @State var searchTransaction: String = ""

    init() {
        setUpContentAppearance()
    }

    var body: some View {
        ZStack {
            Color(Asset.Colors.teal.color)
                .ignoresSafeArea(.all)

            VStack {
                HStack {
                    Spacer()
                        .frame(width: 30)

                    Button(action: {
                    }) {
                        Image(uiImage: Asset.Images.arrowLeftIconWhite.image)
                            .frame(width: 10, height: 10)
                    }
                    .buttonStyle(
                        CircleButtonStyle(buttonColor: Asset.Colors.teal.color)
                    )

                    Spacer()

                    Text(L10n.TransactionsPage.titleBar)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .font(.title2)

                    Spacer()

                    Button(action: {
                    }, label: {
                        Image(uiImage: Asset.Images.addIconTeal.image)
                            .frame(width: 10, height: 10)
                    })
                    .buttonStyle(CircleButtonStyle(buttonColor: .white))

                    Spacer()
                        .frame(width: 30)
                }

                Spacer()
                    .frame(height: 30)

                ZStack {
                    Rectangle()
                        .fill(Color(Asset.Colors.solitudeGrey.color))
                        .cornerRadius(45, corners: [.topLeft, .topRight])
                        .edgesIgnoringSafeArea(.bottom)

                    VStack {
                        Spacer()
                            .frame(height: 30)

                        HStack {
                            Spacer()
                                .frame(width: 30)

                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color(Asset.Colors.solitudeGrey.color))
                                .frame(height: 48)
                                .shadow(color: Color.black.opacity(0.2), radius: 15, x: 7, y: 7)
                                .shadow(color: Color.white.opacity(0.7), radius: 15, x: -5, y: -5)
                                .overlay(
                                    HStack {
                                        TextField(
                                            L10n.TransactionsPage.transactionSearchPlaceholder,
                                            text: $searchTransaction
                                        )
                                        .background(Color.clear)
                                        .frame(height: 48, alignment: .center)
                                        .padding(.leading, 20)
                                        .keyboardType(.default)

                                        Spacer()

                                        Image(uiImage: Asset.Images.searchIcon.image)
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .padding(.trailing, 20)
                                    }
                                )

                            Button(action: {
                            }) {
                                Image(uiImage: Asset.Images.filterIcon.image)
                            }
                            .buttonStyle(
                                TealRoundedRectangleButtonStyle()
                            )

                            Spacer()
                                .frame(width: 30)
                        }

                        Spacer()
                            .frame(height: 20)

                        List(store.state.transactionState.transactions, id: \.id) {
                            TransactionRowContent(transaction: $0)
                        }
                    }
                }
            }
        }
    }

    private func setUpContentAppearance() {
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
}
