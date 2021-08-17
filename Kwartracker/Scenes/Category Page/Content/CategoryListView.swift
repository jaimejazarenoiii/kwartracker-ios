//
//  CategoryListView.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 5/31/21.
//

import SwiftUI

struct CategoryListView: View {
    @State var show: Bool = false
    var title: String
    var subCategory: [Category] = []
    var isParent: Bool
    
    private let shadowRadius: CGFloat = 0
    private let shadowOffset = CGPoint(x: 0, y: 0)
    private let rectRadius: CGFloat = 17
    private let cornerRadius: CGFloat = 15
    private let rectangleSize: CGFloat = 40
    private let rectangleBorder: CGFloat = 50
    private let rectangleBorderWidth: CGFloat = 2
    private let verticalMargin: CGFloat = 8
    private let fontSize: CGFloat = 14
    private let leftMargin: CGFloat = 40
    private let animationSpeed: Double = 2

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
            .onTapGesture {
                withAnimation(Animation.spring().speed(animationSpeed)) {}
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            BWNeumorphicRectangle(rectRadius: rectRadius,
                                  color: show ? Color(Asset.Colors.activeGrey.color) :
                                                Color(Asset.Colors.solitudeGrey.color),
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

        if !subCategory.isEmpty, show {
            VStack(alignment: .leading, spacing: 4) {
                ForEach(subCategory) { sub in
                    CategoryListView(title: sub.title, isParent: false)
                }
                .padding(.vertical, verticalMargin)
                .padding(.leading, leftMargin)
            }
        }
    }
}
