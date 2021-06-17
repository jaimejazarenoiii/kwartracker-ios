//
//  EditCategoryBodyView.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 6/1/21.
//

import SwiftUI

struct EditCategoryBodyView: View {
    @State var category = ""
    @State var isParent = false
    private let cornerRadius: CGFloat = 30
    private let rectangleSize: CGFloat = 100
    private let textOpacity: Double = 0.5

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                if !isParent {
                    TopRightButtonView(image: Asset.Images.trashIcon.image)
                }
                
                VStack {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .frame(width: rectangleSize, height: rectangleSize)
                        .foregroundColor(Color(Asset.Colors.teal.color))

                    Text(L10n.EditCategoryPage.ContentText.selectIcon)
                        .foregroundColor(Color(Asset.Colors.spindleGrey.color))
                        .font(.caption)
                        .fontWeight(.semibold)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
                
                UserField(fieldType: .category, textValue: $category)
                    .padding(.horizontal)
                
                VStack(alignment: .leading) {
                    Text(L10n.EditCategoryPage.ContentText.makeParentCategory)
                        .font(.footnote)
                        .foregroundColor(Color(Asset.Colors.spindleGrey.color))
                        .padding(.top)
                    Toggle("", isOn: $isParent)
                        .toggleStyle(CustomToggle(onText: L10n.EditCategoryPage.ContentText.toggleOn,
                                                  offText: L10n.EditCategoryPage.ContentText.toggleOff))
                }.padding()
            
                
                VStack(alignment: .leading) {
                    Text(L10n.EditCategoryPage.ContentText.selectParentCategory)
                        .font(.footnote)
                        .foregroundColor(isParent ?
                                            Color(Asset.Colors.spindleGrey.color).opacity(textOpacity) :
                                            Color(Asset.Colors.spindleGrey.color))
                    DropDown(isParent: isParent)
                }.padding()
            }.padding()
        }
    }
}

struct EditCategoryBodyView_Previews: PreviewProvider {
    static var previews: some View {
        EditCategoryBodyView()
    }
}

private struct DropDown: View {
    let isParent: Bool
    @State var show = false
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

    private let shadowRadius: CGFloat = 8
    private let shadowOffset = CGPoint(x: 6, y: 6)
    private let rectRadius: CGFloat = 17
    private let verticalMargin: CGFloat = 8
    private let leftMargin: CGFloat = 40
    private let dropDownRectangleRadius: CGFloat = 15
    private let dropDownIconContainerSize: CGFloat = 40
    private let dropDownTextOpacity: Double = 0.2
    private let dropDownIconWidth: CGFloat = 11
    private let dropDownIconHeight: CGFloat = 6
    private let dropDownTrailingPadding: CGFloat = 5
    private let dropDownAnimationSpeed: Double = 1
    
    var body: some View {
        ZStack(alignment: .trailing) {
            BWNeumorphicRectangle(rectRadius: rectRadius,
                                  color: Color(Asset.Colors.solitudeGrey.color),
                                  shadowRadius: shadowRadius,
                                  shadowOffset: shadowOffset)
            
            HStack {
                Text(isParent ?
                        L10n.EditCategoryPage.ContentText.selectParent :
                        L10n.EditCategoryPage.ContentText.selectParentCategory)
                    .foregroundColor(isParent ? Color(Asset.Colors.spindleGrey.color) : .black)
                Spacer()
                RoundedRectangle(cornerRadius: dropDownRectangleRadius)
                    .frame(width: dropDownIconContainerSize, height: dropDownIconContainerSize, alignment: .center)
                    .foregroundColor(Color(Asset.Colors.spindleGrey.color).opacity(dropDownTextOpacity))
                    .background(
                        Image(uiImage: Asset.Images.dropDownIcon.image)
                            .resizable()
                            .frame(width: dropDownIconWidth, height: dropDownIconHeight, alignment: .center)
                    )
            }
            .padding(.trailing, dropDownTrailingPadding)
            .padding(.leading)
            .onTapGesture(perform: {
                if !isParent {
                    withAnimation(Animation.spring().speed(dropDownAnimationSpeed)) {
                        show.toggle()
                    }
                }
            })
            // Can be change to .fullScreenCover
            .sheet(isPresented: $show) {
                OptionSelectView(
                    presented: $show,
                    options: $options,
                    values: $fieldValues,
                    selectedField: $transactionFieldType
                )
            }
        }
    }
}
