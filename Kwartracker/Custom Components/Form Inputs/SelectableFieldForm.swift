//
//  SelectableFieldForm.swift
//  Kwartracker
//
//  Created by Jacob on 5/8/21.
//

import SwiftUI

struct SelectableFieldForm: View {
    let defaultSelectionType: TransactionFieldType
    var label: String
    var selectLabel: String
    @Binding var showOptions: Bool
    @Binding var transactionSelection: TransactionFieldType

    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text(label)
                    .foregroundColor(Color(Asset.Colors.spindleGrey.color))
                    .font(.system(size: 15))
                ZStack {
                    Button(action: {
                        UIApplication.shared.endEditing()
                        showOptions.toggle()
                        transactionSelection = defaultSelectionType
                    }) {
                        HStack {
                            Spacer()
                                .frame(width: 16)
                            Text(selectLabel)
                                .foregroundColor(Color(Asset.Colors.charcoal.color))
                            Spacer()
                            ZStack {
                                Rectangle()
                                    .fill(Color(Asset.Colors.mysticBlueGrey.color))
                                    .cornerRadius(10, corners: [.allCorners])
                                    .frame(width: 40, height: 40)
                                Image(uiImage: Asset.Images.dropDownIcon.image)
                            }
                            .padding(.trailing, 0)
                        }
                    }
                    .buttonStyle(
                        RoundedRectangleButtonStyle(
                            buttonColor: Asset.Colors.solitudeGrey.color,
                            padding: 5
                        )
                    )
                }
            }
        }
    }
}
