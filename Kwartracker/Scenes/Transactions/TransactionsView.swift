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
        setUpTableViewAppearance()
    }

    var body: some View {
        NavigationView {
            ZStack {
                Color(Asset.Colors.teal.color)
                    .ignoresSafeArea(.all)

                VStack {
                    TransactionsHeaderView()

                    Spacer()
                        .frame(height: 30)

                    ZStack {
                        Rectangle()
                            .fill(Color(Asset.Colors.solitudeGrey.color))
                            .cornerRadius(45, corners: [.topLeft, .topRight])
                            .edgesIgnoringSafeArea(.bottom)

                        VStack {
                            TransactionsSearchBarView(searchTransaction: $searchTransaction)
                            TransactionsListView(
                                transactions: store.state.transactionState.transactions,
                                shouldShowLoadmore: store.state.transactionState.shouldShowLoadmore
                            )
                        }
                    }
                }
                .padding(.top, 10)
            }
            .navigationBarHidden(true)
        }
    }

    private func setUpTableViewAppearance() {
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
}

private struct TransactionsHeaderView: View {
    var body: some View {
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
    }
}

private struct TransactionsSearchBarView: View {
    @Binding var searchTransaction: String

    var body: some View {
        Group {
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
        }
    }
}

private struct TransactionsListView: View {
    var transactions: [Transaction]
    var shouldShowLoadmore: Bool = false

    var body: some View {
        Group {
            Spacer()
                .frame(height: 20)

            List {
                ForEach(transactions, id: \.id) { transaction in
                    ZStack {
                        TransactionRow(transaction: transaction)
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
                LoaderView(shouldShowLoadmore: shouldShowLoadmore)
            }
            .listStyle(InsetListStyle())
        }
    }
}

private struct LoaderView: View {
    var shouldShowLoadmore: Bool
    var body: some View {
        Group {
            if shouldShowLoadmore {
                HStack {
                    Spacer()
                    CircularLoaderView()
                        .frame(width: 30, height: 30)
                    Spacer()
                }
                .padding(.top, 10)
            }
        }
    }
}
