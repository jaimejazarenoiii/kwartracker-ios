//
//  TextGroupView.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 5/31/21.
//

import SwiftUI

struct TextGroupView: View {
    let text: String
    let fontSize: CGFloat?
    let bottomMargin: CGFloat?
    let fontColor: Color
    
    private let defaultFontSize: CGFloat = 17
    private let defaultBottomMargin: CGFloat = 15

    var body: some View {
        Text(text)
            .font(Font.system(size: fontSize ?? defaultFontSize))
            .fontWeight(.bold)
            .padding(.bottom, bottomMargin ?? defaultBottomMargin)
            .foregroundColor(fontColor)
    }
}
