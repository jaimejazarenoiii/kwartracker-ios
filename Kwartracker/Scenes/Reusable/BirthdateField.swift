//
//  BirthdateField.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 5/24/21.
//

import SwiftUI

struct BirthdateField: View {
    @Binding var textValue: String
    let placeholder: String
    
    private let colorOpacity: Double = 0.3
    private let calendarImageSize: CGFloat = 15
    private let leadingSideMargin: CGFloat = 20
    private let calendarContainerSize: CGFloat = 40
    private let calendarCotnainerRadius: CGFloat = 13
    let calendarIcon = Asset.Images.calendarIcon.image.withRenderingMode(.alwaysTemplate).withTintColor(.white)

    var body: some View {
        HStack {
            TextField(placeholder, text: $textValue)
                .italicPlaceholder(placeholder)
            RoundedRectangle(cornerRadius: calendarCotnainerRadius)
                .foregroundColor(Color(Asset.Colors.spindleGrey.color).opacity(colorOpacity))
                .frame(width: calendarContainerSize, height: calendarContainerSize, alignment: .center)
                .background(
                    Image(uiImage: calendarIcon)
                        .resizable()
                        .foregroundColor(Color(Asset.Colors.spindleGrey.color))
                        .frame(width: calendarImageSize, height: calendarImageSize, alignment: .center)
                )
        }
        .padding(.leading, leadingSideMargin)
        .padding(.trailing, leadingSideMargin / 4)
    }
}

fileprivate extension TextField {
    func italicPlaceholder(_ placeholder: String) -> some View {
        return Text(placeholder)
                .italic()
                .foregroundColor(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
    }
}
