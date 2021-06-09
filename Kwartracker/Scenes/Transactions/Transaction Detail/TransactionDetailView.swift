//
//  TransactionDetailView.swift
//  Kwartracker
//
//  Created by Jacob on 5/9/21.
//

import SwiftUI

struct TransactionDetailView: View {
    var transaction: Transaction
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack {
            VStack {
                NavigationBarView(
                    title: L10n.TransactionsPage.titleBar) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
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

                    VStack(spacing: 20) {
                        HStack {
                            Spacer()
                            Button(action: {
                            }) {
                                Image(uiImage: Asset.Images.trashIcon.image)
                                    .frame(width: 10, height: 10)
                            }
                            .buttonStyle(CircleButtonStyle(buttonColor: .white, padding: 10))
                        }
                        .padding([.top, .trailing], 30)

                        ZStack {
                            Rectangle()
                                .fill(Color(Asset.Colors.solitudeGrey.color))
                                .cornerRadius(20, corners: .allCorners)
                                .frame(height: 120)
                                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 2, y: 2)
                                .shadow(color: Color(Asset.Colors.solitudeGrey.color), radius: 5, x: -2, y: -2)
                            VStack(alignment: .center, spacing: 3) {
                                Text("P10,000.00")
                                    .font(.system(size: 40, weight: .medium))
                                    .foregroundColor(Color(Asset.Colors.niagaraGreen.color))
                                Text("March 15 payroll")
                                    .font(.system(size: 16))
                                    .foregroundColor(Color(Asset.Colors.charcoal.color))
                            }
                        }
                        .padding([.leading, .trailing], 30)

                        HStack(alignment: .top) {

                            VStack(alignment: .leading, spacing: 6) {
                                Text(L10n.TransactionDetailPage.Label.transactionType)
                                    .font(.system(size: 12))
                                    .foregroundColor(Color(Asset.Colors.spindleGrey.color))
                                Text("Income")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(Color(Asset.Colors.charcoal.color))
                            }

                            Spacer()

                            VStack(alignment: .leading, spacing: 6) {
                                Text(L10n.TransactionDetailPage.Label.transactionDate)
                                    .font(.system(size: 12))
                                    .foregroundColor(Color(Asset.Colors.spindleGrey.color))
                                Text("March 15, 2021")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(Color(Asset.Colors.charcoal.color))
                            }

                            Spacer()
                        }
                        .padding([.leading, .trailing], 30)
                        .padding(.top, 10)

                        HStack(alignment: .top) {
                            VStack(alignment: .leading, spacing: 6) {
                                Text(L10n.TransactionDetailPage.Label.category)
                                    .font(.system(size: 12))
                                    .foregroundColor(Color(Asset.Colors.spindleGrey.color))
                                Text("Salary")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(Color(Asset.Colors.charcoal.color))
                            }

                            Spacer()

                            VStack(alignment: .leading, spacing: 6) {
                                Text(L10n.TransactionDetailPage.Label.addedToWallet)
                                    .font(.system(size: 12))
                                    .foregroundColor(Color(Asset.Colors.spindleGrey.color))
                                Text("BPI Savings")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(Color(Asset.Colors.charcoal.color))
                            }

                            Spacer()
                        }
                        .padding([.leading, .trailing], 30)
                        .padding(.top, 10)

                        HStack(alignment: .top) {
                            VStack(alignment: .leading, spacing: 6) {
                                Text(L10n.TransactionDetailPage.Label.spentWith)
                                    .font(.system(size: 12))
                                    .foregroundColor(Color(Asset.Colors.spindleGrey.color))
                                Text("Juan dela Cruz")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(Color(Asset.Colors.charcoal.color))
                            }
                            Spacer()
                        }
                        .padding([.leading, .trailing], 30)
                        .padding(.top, 10)

                        Spacer()
                    }
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
    }
}

struct TransactionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionDetailView(transaction: Transaction(category: Category(id: 1, title: "")))
    }
}
