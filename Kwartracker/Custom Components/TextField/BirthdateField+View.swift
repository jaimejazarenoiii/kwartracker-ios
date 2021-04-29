//
//  TextField+Extension.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 4/29/21.
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

    var body: some View {
        HStack {
            TextField(placeholder, text: $textValue)
            RoundedRectangle(cornerRadius: calendarCotnainerRadius)
                .foregroundColor(Color(Asset.Colors.spindleGrey.color).opacity(colorOpacity))
                .frame(width: calendarContainerSize, height: calendarContainerSize, alignment: .center)
                .background(
                    Image(uiImage: Asset.Images.calendarIcon.image
                                              .withRenderingMode(.alwaysTemplate).withTintColor(.white))
                        .resizable()
                        .foregroundColor(Color(Asset.Colors.spindleGrey.color))
                        .frame(width: calendarImageSize, height: calendarImageSize, alignment: .center)
                )
        }
        .padding(.leading, leadingSideMargin)
        .padding(.trailing, leadingSideMargin / 4)
    }
}
