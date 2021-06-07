//
//  TextGroupView.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 5/31/21.
//

import SwiftUI

struct TextGroupView: View {
    let text: String
    let fontSize: CGFloat
    let bottomMargin: CGFloat
    let fontColor: Color
    
    init(
        text: String,
        fontSize: CGFloat = 17,
        bottomMargin: CGFloat = 15,
        fontColor: Color
    ) {
        self.text = text
        self.fontSize = fontSize
        self.bottomMargin = bottomMargin
        self.fontColor = fontColor
    }

    var body: some View {
        Text(text)
            .font(Font.system(size: fontSize))
            .fontWeight(.bold)
            .padding(.bottom, bottomMargin)
            .foregroundColor(fontColor)
    }
}
