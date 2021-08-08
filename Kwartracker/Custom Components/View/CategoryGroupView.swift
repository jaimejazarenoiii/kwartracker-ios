//
//  CategoryGroupView.swift
//  Kwartracker
//
//  Created by Jacob on 8/8/21.
//

import SwiftUI

struct CategoryGroupView: View {
    @State var show: Bool = false
    var categoryGroup: CategoryGroup
    var onSelect: ((CategoryGroup) -> Void)

    private let rectRadius: CGFloat = 17
    private let cornerRadius: CGFloat = 15
    private let shadowRadius: CGFloat = 0
    private let shadowOffset = CGPoint(x: 0, y: 0)
    private let rectangleBorder: CGFloat = 50
    private let rectangleBorderWidth: CGFloat = 2

    var body: some View {
        CategoryRow(title: categoryGroup.title)
            .background(
                BWNeumorphicRectangle(rectRadius: rectRadius,
                                      color: Color(Asset.Colors.activeGrey.color),
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
                onSelect(categoryGroup)
            }
    }
}

struct CategoryGroupView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryGroupView(categoryGroup: CategoryGroup(id: 1, title: "Test")) { _ in }
    }
}
