//
//  SelectableFieldForm.swift
//  Kwartracker
//
//  Created by Jacob on 5/8/21.
//

import SwiftUI

struct SelectableFieldForm: View {
    var label: String
    var selectLabel: String
    @State private var showOptions: Bool = false
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
            VStack(alignment: .leading) {
                Text(label)
                    .foregroundColor(Color(Asset.Colors.spindleGrey.color))
                    .font(.system(size: 15))
                ZStack {
                    Button(action: {
                        showOptions.toggle()
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
            OptionSelectView(presented: $showOptions, options: $options)
        }
    }
}
