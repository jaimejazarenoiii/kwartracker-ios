//
//  CategoryRow.swift
//  Kwartracker
//
//  Created by Jacob on 8/8/21.
//

import SwiftUI

struct CategoryRow: View {
    var title: String

    private let cornerRadius: CGFloat = 15
    private let rectangleSize: CGFloat = 40
    private let verticalMargin: CGFloat = 8
    private let fontSize: CGFloat = 14

    var body: some View {
        ZStack {
            HStack {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .frame(width: rectangleSize, height: rectangleSize)
                    .foregroundColor(Color(Asset.Colors.teal.color))
                    .padding(.leading, verticalMargin)
                Text(title)
                    .font(.system(size: fontSize))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(title: "Test")
    }
}
