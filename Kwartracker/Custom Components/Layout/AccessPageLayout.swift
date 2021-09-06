//
//  AccessPageLayout.swift
//  Kwartracker
//
//  Created by Jacob on 8/30/21.
//

import SwiftUI

struct AccessPageLayout<C: View>: View {
    private let contentView: C
    private let topBodyMargin: CGFloat = 5
    private let tealColor = Color(Asset.Colors.teal.color)
    private let solitudeGrayColor = Color(Asset.Colors.solitudeGrey.color)
    private let rectRadius: CGFloat = 60
    private let leadingMargin: CGFloat = 40
    private let contentSpacing: CGFloat = 10

    init(@ViewBuilder content: @escaping () -> C) {
        self.contentView = content()
    }

    var body: some View {

        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                VStack {
                    HStack(spacing: contentSpacing) {
                        Image(Asset.Images.headerLogoIcon.name)
                        Spacer()
                    }
                    .padding(.leading, leadingMargin)
                }
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
