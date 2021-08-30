//
//  AccessPageLayout.swift
//  Kwartracker
//
//  Created by Jacob on 8/30/21.
//

import SwiftUI

struct AccessPageLayout<H: View, C: View>: View {
    private let HeaderView: H
    private let contentView: C
    private let topBodyMargin: CGFloat = 5
    private let tealColor = Color(Asset.Colors.teal.color)
    private let solitudeGrayColor = Color(Asset.Colors.solitudeGrey.color)
    private let rectRadius: CGFloat = 60


    init(@ViewBuilder header: @escaping () -> H, @ViewBuilder body: @escaping () -> C) {
        self.HeaderView = header()
        self.contentView = body()
    }

    var body: some View {

        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                HeaderView
                    .padding(.top, safeAreaInsets.top)

                ZStack {
                    RoundedCornerRectangle(radius: rectRadius, corner: [.topLeft, .topRight])

                    VStack {
                        contentView
                            .clipShape(RoundedRectangle(cornerRadius: rectRadius))
                    }
                }
                .padding(.top)
            }
        }
        .background(linearGradient)
        .ignoresSafeArea()
    }

    private var linearGradient: some View {
        let colors = [tealColor, solitudeGrayColor, solitudeGrayColor]
        return LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom)
    }
}
