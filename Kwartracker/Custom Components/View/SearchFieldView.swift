//
//  SearchFieldView.swift
//  Kwartracker
//
//  Created by Jacob on 7/25/21.
//

import SwiftUI

struct SearchFieldView: View {
    var searchFieldPlaceholder: String = "Search..."
    var onCommitAction: (() -> Void)
    @Binding var searchTerm: String

    private let rectangleCornerRadius: CGFloat = 15
    private let rectangleFrameHeight: CGFloat = 48
    private let blackShadowOpacity: Double = 0.2
    private let blackShadowXY: CGFloat = 7
    private let shadowRadius: CGFloat = 15
    private let whiteShadowOpacity: Double = 0.7
    private let whiteShadowXY: CGFloat = -5
    private let textFieldLeadingPadding: CGFloat = 20
    private let searchIconHeightWidth: CGFloat = 20
    private let searchIconTrailing: CGFloat = 20

    var body: some View {
        HStack {
            let blackShadowColor = Color.black.opacity(blackShadowOpacity)
            let whiteShadowColor = Color.white.opacity(whiteShadowOpacity)
            RoundedRectangle(cornerRadius: rectangleCornerRadius)
                .fill(Color(Asset.Colors.solitudeGrey.color))
                .frame(height: rectangleFrameHeight)
                .shadow(color: blackShadowColor, radius: shadowRadius, x: blackShadowXY, y: blackShadowXY)
                .shadow(color: whiteShadowColor, radius: shadowRadius, x: whiteShadowXY, y: whiteShadowXY)
                .overlay(
                    HStack {
                        TextField(searchFieldPlaceholder,
                                  text: $searchTerm,
                                  onCommit: onCommitAction)
                        .background(Color.clear)
                        .frame(height: rectangleFrameHeight, alignment: .center)
                        .padding(.leading, textFieldLeadingPadding)
                        .keyboardType(.webSearch)

                        Spacer()

                        Image(uiImage: Asset.Images.searchIcon.image)
                            .resizable()
                            .frame(width: searchIconHeightWidth, height: searchIconHeightWidth)
                            .padding(.trailing, searchIconTrailing)
                    }
                )
        }
    }
}
