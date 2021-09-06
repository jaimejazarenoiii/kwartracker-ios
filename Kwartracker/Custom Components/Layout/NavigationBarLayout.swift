//
//  NavigationBarLayout.swift
//  Kwartracker
//
//  Created by Jacob on 9/2/21.
//

import SwiftUI

struct NavigationBarLayout<H: View, C: View>: View {
    private let headerView: H
    private let contentView: C
    private let topBodyMargin: CGFloat = 5
    private let tealColor = Color(Asset.Colors.teal.color)
    private let solitudeGrayColor = Color(Asset.Colors.solitudeGrey.color)
    private let rectRadius: CGFloat = 60
    private let leadingMargin: CGFloat = 40
    private let contentSpacing: CGFloat = 10

    init(
        @ViewBuilder header: @escaping () -> H,
        @ViewBuilder body: @escaping () -> C
    ) {
        headerView = header()
        contentView = body()
    }

    var body: some View {
        VStack {
            headerView
                .padding(.top, safeAreaInsets.top)

            ScrollView(.vertical, showsIndicators: false) {
                contentView
                    .background(RoundedCornerRectangle(radius: rectRadius, corner: [.topLeft, .topRight]))
                    .padding(.top)
            }
            .adaptsToKeyboard()
        }
        .background(linearGradient)
        .ignoresSafeArea()
    }

    private var linearGradient: some View {
        let colors = [tealColor, solitudeGrayColor, solitudeGrayColor]
        return LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom)
    }
}
