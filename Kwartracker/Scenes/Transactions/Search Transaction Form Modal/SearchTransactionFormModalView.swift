//
//  SearchTransactionFormModalView.swift
//  Kwartracker
//
//  Created by Jacob on 5/8/21.
//

import SwiftUI

struct SearchTransactionFormModalView: View {
    @EnvironmentObject var store: AppStore
    @Binding var isPresented: Bool
    @State var isOptionSelectViewPresented: Bool = false
    
    @State var fieldValues =  [L10n.TransactionsCreateFormModal.InputField.dateRange,
                               L10n.TransactionsCreateFormModal.InputField.walletType,
                               L10n.TransactionsCreateFormModal.InputField.category]
    
    @State var transactionFieldType: TransactionFieldType = .dateRange
    
    @State private var options: [OptionItem] = [
        OptionItem(description: "test1", value: "1"),
        OptionItem(description: "test2", value: "2"),
        OptionItem(description: "test2", value: "2"),
        OptionItem(description: "test2", value: "2"),
        OptionItem(description: "test2", value: "2"),
        OptionItem(description: "test2", value: "2"),
        OptionItem(description: "test2", value: "2"),
        OptionItem(description: "test2", value: "2"),
        OptionItem(description: "test2", value: "2"),
    ]
    
    var body: some View {
        ZStack {
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
                            defaultSelectionType: .dateRange,
                            label: L10n.TransactionsCreateFormModal.InputLabel.dateRange,
                            selectLabel: fieldValues[TransactionFieldType.dateRange.rawValue],
                            showOptions: $isOptionSelectViewPresented,
                            transactionSelection: $transactionFieldType
                        )
                        SelectableFieldForm(
                            defaultSelectionType: .walletType,
                            label: L10n.TransactionsCreateFormModal.InputLabel.walletType,
                            selectLabel: fieldValues[TransactionFieldType.walletType.rawValue],
                            showOptions: $isOptionSelectViewPresented,
                            transactionSelection: $transactionFieldType
                        )
                        SelectableFieldForm(
                            defaultSelectionType: .category,
                            label: L10n.TransactionsCreateFormModal.InputLabel.category,
                            selectLabel: fieldValues[TransactionFieldType.category.rawValue],
                            showOptions: $isOptionSelectViewPresented,
                            transactionSelection: $transactionFieldType
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
            
            OptionSelectView(presented: $isOptionSelectViewPresented,
                             options: $options,
                             values: $fieldValues,
                             selectedField: $transactionFieldType)
        }
        .onTapGesture {
            if isOptionSelectViewPresented {
                isOptionSelectViewPresented = false
            }
        }
    }

    func toggleModalWithAnimation() {
        withAnimation {
            isPresented.toggle()
        }
    }
}

enum TransactionFieldType: Int {
    case dateRange, walletType, category
}
