//
//  CreateTransactionFormModalView.swift
//  Kwartracker
//
//  Created by Jacob on 5/8/21.
//

import SwiftUI

struct CreateTransactionFormModalView: View {
    @EnvironmentObject var store: AppStore
    @Binding var isPresented: Bool

    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 30) {
                Spacer()
                    .frame(height: 10)
                HStack(alignment: .center) {
                    Text(L10n.TransactionsCreateFormModal.title)
                        .font(.title2)
                        .bold()
                        .foregroundColor(Color(Asset.Colors.charcoal.color))
                    Spacer()
                    Button(action: {
                        toggleModalWithAnimation()
                    }, label: {
                        Image(uiImage: Asset.Images.closeIcon.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 10, height: 10)
                    })
                    .buttonStyle(CircleButtonStyle(buttonColor: .white, padding: 10))
                }
                .padding([.leading, .trailing], 30)

                VStack(spacing: 20) {
                    SelectableFieldForm(
                        menuPresenting: Binding.constant(false),
                        label: L10n.TransactionsCreateFormModal.InputLabel.dateRange,
                        selectLabel: L10n.TransactionsCreateFormModal.InputField.dateRange
                    )
                    SelectableFieldForm(
                        menuPresenting: Binding.constant(false),
                        label: L10n.TransactionsCreateFormModal.InputLabel.walletType,
                        selectLabel: L10n.TransactionsCreateFormModal.InputField.walletType
                    )
                    SelectableFieldForm(
                        menuPresenting: Binding.constant(false),
                        label: L10n.TransactionsCreateFormModal.InputLabel.category,
                        selectLabel: L10n.TransactionsCreateFormModal.InputField.category
                    )
                    Spacer()
                        .frame(height: 10)
                    Button(action: {}) {
                        HStack {
                            Spacer()
                            Text(L10n.TransactionsCreateFormModal.ButtonTitle.apply)
                                .foregroundColor(.white)
                            Spacer()
                        }
                    }
                    .buttonStyle(RoundedRectangleButtonStyle(buttonColor: Asset.Colors.teal.color))
                }
                .padding([.leading, .trailing], 30)
            }
            .background(
                Rectangle()
                    .fill(Color(Asset.Colors.solitudeGrey.color))
                    .cornerRadius(45, corners: [.topLeft, .topRight])
                    .edgesIgnoringSafeArea(.bottom)
            )
            .offset(y: isPresented ? 0 : UIScreen.main.bounds.height)
        }
        .background(
            Color.black
                .opacity(isPresented ? 0.6 : 0)
                .ignoresSafeArea()
        )
    }

    func toggleModalWithAnimation() {
        withAnimation {
            isPresented.toggle()
        }
    }
}
