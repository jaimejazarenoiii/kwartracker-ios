//
//  CategoriesView.swift
//  Kwartracker
//
//  Created by Jacob on 8/8/21.
//

import SwiftUI

struct CategoriesView: View {
    var categories: [Category]
    var onSelect: ((Category) -> Void)

    private let verticalMargin: CGFloat = 8
    private let leftMargin: CGFloat = 40
    private let shadowRadius: CGFloat = 0
    private let shadowOffset = CGPoint(x: 0, y: 0)
    private let rectangleBorder: CGFloat = 50
    private let rectangleBorderWidth: CGFloat = 2
    private let rectRadius: CGFloat = 17
    private let cornerRadius: CGFloat = 15

    var body: some View {
        if !categories.isEmpty {
            VStack(alignment: .leading, spacing: 4) {
                ForEach(categories, id: \.id) { category in
                    CategoryRow(title: category.title)
                        .background(
                            BWNeumorphicRectangle(
                                rectRadius: rectRadius,
                                color: Color(Asset.Colors.solitudeGrey.color),
                                shadowRadius: shadowRadius,
                                shadowOffset: shadowOffset
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: cornerRadius)
                                    .stroke(lineWidth: rectangleBorderWidth)
                                    .frame(height: rectangleBorder, alignment: .center)
                                    .foregroundColor(Color(Asset.Colors.activeGrey.color))
                            )
                        )
                        .onTapGesture {
                            onSelect(category)
                        }
                }
                .padding(.vertical, verticalMargin)
                .padding(.leading, leftMargin)
            }
        }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView(categories: [], onSelect: { _ in })
    }
}
