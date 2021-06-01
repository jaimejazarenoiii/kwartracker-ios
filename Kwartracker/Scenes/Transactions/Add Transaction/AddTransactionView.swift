//
//  AddTransactionView.swift
//  Kwartracker
//
//  Created by Jacob on 5/9/21.
//

import SwiftUI

struct AddTransactionView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var showTransactionPageType: AddTransactionPageViewType = .chooseWalletPage
    @State var inputAmount: String = "₱ 00.00"
    @State var inputTransactionName: String = ""
    @State var inputTransactionType: String = ""
    @State var inputCategory: String = ""
    @State var inputDate: String = ""
    @State var inputSpentWithPerson: String = ""
    @State var isSelectWalletOptionPresented: Bool = false
    @State var transactionFieldType: TransactionFieldType = .dateRange
    @State var fieldValues =  [
        L10n.TransactionsCreateFormModal.InputField.dateRange,
        L10n.TransactionsCreateFormModal.InputField.walletType,
        L10n.TransactionsCreateFormModal.InputField.category
    ]
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
                NavigationBarView(
                    title: L10n.AddTransactionPage.titleBar) {
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
                } rightBarViewContent: {}

                ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                    Rectangle()
                        .fill(Color(Asset.Colors.solitudeGrey.color))
                        .cornerRadius(45, corners: [.topLeft, .topRight])
                        .edgesIgnoringSafeArea(.bottom)

                    // First page to show
                    SelectWalletView(
                        showTransactionPageType: $showTransactionPageType,
                        isSelectWalletOptionPresented: $isSelectWalletOptionPresented,
                        transactionFieldType: $transactionFieldType
                    )

                    // Second page to show
                    TransactionDetailInputView(
                        showTransactionPageType: $showTransactionPageType,
                        inputAmount: $inputAmount,
                        inputTransactionName: $inputTransactionName,
                        isSelectWalletOptionPresented: $isSelectWalletOptionPresented,
                        inputSpentWithPerson: $inputSpentWithPerson,
                        transactionFieldType: $transactionFieldType
                    )
                }
                .padding(.top, 20)
            }
            .padding(.top, 10)

            OptionSelectView(
                presented: $isSelectWalletOptionPresented,
                options: $options,
                values: $fieldValues,
                selectedField: $transactionFieldType
            )
        }
        .background(
            Color(Asset.Colors.teal.color)
                .ignoresSafeArea()
        )
        .navigationBarHidden(true)
        .onAppear {
            showTransactionPageType = .chooseWalletPage
        }
        .onTapGesture {
            if isSelectWalletOptionPresented {
                isSelectWalletOptionPresented = true
            }
        }
    }
}

struct AddTransactionView_Previews: PreviewProvider {
    static var previews: some View {
        AddTransactionView()
    }
}

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

private struct SelectWalletView: View {
    @Binding var showTransactionPageType: AddTransactionPageViewType
    @Binding var isSelectWalletOptionPresented: Bool
    @Binding var transactionFieldType: TransactionFieldType

    var body: some View {
        VStack(spacing: 30) {
            Spacer()
                .frame(height: 150)
            SelectableFieldForm(
                defaultSelectionType: .walletType,
                label: L10n.AddTransactionPage.FieldLabel.whichWalletDoYouWantToAdd,
                selectLabel: L10n.AddTransactionPage.FieldInput.whichWalletDoYouWantToAdd,
                showOptions: $isSelectWalletOptionPresented,
                transactionSelection: $transactionFieldType
            )
            Button(action: {
                withAnimation {
                    showTransactionPageType = .addTransactionForm
                }
            }) {
                HStack {
                    Spacer()
                    Text(L10n.AddTransactionPage.Button.next)
                        .foregroundColor(.white)
                    Spacer()
                }
            }
            .buttonStyle(RoundedRectangleButtonStyle(buttonColor: Asset.Colors.teal.color))
            Spacer()
        }
        .padding([.leading, .trailing], 30)
        .opacity(showTransactionPageType.shouldShowWalletPage ? 1 : 0)
    }
}

private struct TransactionDetailInputView: View {
    @Binding var showTransactionPageType: AddTransactionPageViewType
    @Binding var inputAmount: String
    @Binding var inputTransactionName: String
    @Binding var isSelectWalletOptionPresented: Bool
    @Binding var inputSpentWithPerson: String
    @Binding var transactionFieldType: TransactionFieldType

    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Spacer().frame(height: 20)
                HStack {
                    Spacer()
                    Text(L10n.AddTransactionPage.FieldLabel.enterAmount)
                        .foregroundColor(Color(Asset.Colors.spindleGrey.color))
                        .font(.system(size: 15))
                    Spacer()
                }
                TextField("₱ 00.00", text: $inputAmount)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 40, weight: .medium))
                    .frame(height: 52)
                TextFieldForm(
                    label: L10n.AddTransactionPage.FieldLabel.transactionName,
                    placeholder: L10n.AddTransactionPage.FieldInput.enterTransactionName,
                    inputValue: $inputTransactionName
                )
                SelectableFieldForm(
                    defaultSelectionType: .category,
                    label: L10n.AddTransactionPage.FieldLabel.transactionType,
                    selectLabel: L10n.AddTransactionPage.FieldInput.selectTransactionType,
                    showOptions: $isSelectWalletOptionPresented,
                    transactionSelection: $transactionFieldType
                )
                SelectableFieldForm(
                    defaultSelectionType: .category,
                    label: L10n.AddTransactionPage.FieldLabel.categoy,
                    selectLabel: L10n.AddTransactionPage.FieldInput.selectCategory,
                    showOptions: $isSelectWalletOptionPresented,
                    transactionSelection: $transactionFieldType
                )
                SelectableFieldForm(
                    defaultSelectionType: .category,
                    label: L10n.AddTransactionPage.FieldLabel.selectDate,
                    selectLabel: L10n.AddTransactionPage.FieldInput.selectDate,
                    showOptions: $isSelectWalletOptionPresented,
                    transactionSelection: $transactionFieldType
                )
                TextFieldForm(
                    label: L10n.AddTransactionPage.FieldLabel.spentWithThisPerson,
                    placeholder: L10n.AddTransactionPage.FieldInput.spentWithThisPerson,
                    inputValue: $inputSpentWithPerson
                )
                HStack {
                    BrowsePhotoField()
                    Spacer()
                }

                Button(action: {}, label: {
                    HStack {
                        Spacer()
                        Text(L10n.AddTransactionPage.Button.add)
                            .foregroundColor(.white)
                        Spacer()
                    }
                })
                .buttonStyle(RoundedRectangleButtonStyle(buttonColor: Asset.Colors.teal.color))
            }
            .padding([.leading, .trailing], 30)
        }
        .opacity(showTransactionPageType.shouldShowAddTransactionForm ? 1 : 0)
    }
}
