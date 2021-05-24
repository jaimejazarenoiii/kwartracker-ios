//
//  OptionSelectView.swift
//  Kwartracker
//
//  Created by Jacob on 5/9/21.
//

import SwiftUI

struct OptionItem {
    var description: String
    var value: String
    var isSelected: Bool = false
}

struct OptionSelectView: View {
    @Binding var presented: Bool
    @Binding var options: [OptionItem]

    var body: some View {
        VStack {
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(0..<options.count) { index in
                        let option = options[index]

                        VStack(alignment: .leading) {
                            Spacer()
                                .frame(height: 10)

                            HStack(alignment: .center, spacing: 10) {
                                Spacer()
                                    .frame(width: 11)
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(Asset.Colors.teal.color))
                                    .frame(width: 40, height: 40)
                                Text(option.description)
                                    .foregroundColor(Color(Asset.Colors.charcoal.color))
                                    .font(.system(size: 16, weight: .medium))
                            }
                            Color(Asset.Colors.mysticBlueGrey.color)
                                .frame(height: 1)
                        }
                        .onTapGesture {
                            debugPrint("row is selected")
                        }
                        .background(
                            Rectangle()
                                .fill(option.isSelected ? Color(Asset.Colors.mysticBlueGrey.color) : Color.clear)
                                .cornerRadius(10, corners: .allCorners)
                        )
                    }
                }
                .frame(maxHeight: UIScreen.main.bounds.height / 1.7)
            }
            .padding([.leading, .trailing], 10)
            .frame(idealWidth: presented ? UIScreen.main.bounds.width : 0,
                   maxHeight: presented ? UIScreen.main.bounds.height : 0)
        }
        .background(
            Rectangle()
                .fill(Color(Asset.Colors.solitudeGrey.color))
                .cornerRadius(16, corners: .allCorners)
                .edgesIgnoringSafeArea(.bottom)
                .shadow(color: Color.black.opacity(0.2), radius: 16, x: 16, y: 16)
                .shadow(color: Color.black.opacity(0.2), radius: 16, x: -16, y: -16)
        )
        .padding([.leading, .trailing], 30)
    }
}
