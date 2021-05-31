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
        NavigationView {
            ZStack {
                Color(Asset.Colors.teal.color)
                    .ignoresSafeArea(.all)

                VStack {
                    NavigationBarView(
                        title: L10n.TransactionsPage.titleBar) {
                        Button(action: {
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
                            Image(uiImage: Asset.Images.addIconTeal.image)
                                .frame(width: 10, height: 10)
                        }
                        .buttonStyle(CircleButtonStyle(buttonColor: .white))
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
                                    RoundedRectangleButtonStyle(buttonColor: Asset.Colors.teal.color)
                                )

                                Spacer()
                                    .frame(width: 30)
                            }
                            .buttonStyle(
                                RoundedRectangleButtonStyle(buttonColor: Asset.Colors.teal.color)
                            )

                            Spacer()
                                .frame(height: 20)

                            List {
                                ForEach(store.state.transactionState.transactions, id: \.id) { transaction in
                                    ZStack {
                                        TransactionRowContent(transaction: transaction)
                                        NavigationLink(
                                            destination: TransactionDetailView(transaction: transaction),
                                            label: {
                                                EmptyView()
                                            }
                                        )
                                        .hidden()
                                    }
                                    .listRowBackground(Color.clear)
                                }
                                if store.state.transactionState.shouldShowLoadmore {
                                    HStack {
                                        Spacer()
                                        CircularLoaderView()
                                            .frame(width: 30, height: 30)
                                        Spacer()
                                    }
                                    .padding(.top, 10)
                                }
                            }
                            .listStyle(InsetListStyle())
                        }
                    }
                }
                .padding(.top, 10)
            }
            .navigationBarHidden(true)
        }
    }

    private func setUpContentAppearance() {
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        UITableViewCell.appearance().selectionStyle = .none
    }
}
