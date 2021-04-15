//
//  NavigationHeaderView.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 4/15/21.
//

import SwiftUI

struct NavigationHeaderView: View {
    let navigationTitle: String
    
    private let horizontalMargin: CGFloat = 40
    private let verticalMargin: CGFloat = 20
    private let colorOpacity: Double = 0.3
    private let shadowRadius: CGFloat = 5
    private let shadowXaxis: CGFloat = 8
    private let shadowYaxis: CGFloat = 5
    private let backButtonSize: CGFloat = 35

    var body: some View {
        HStack {
            Button(action: {}, label: {
                 Image(uiImage: Asset.Images.arrowLeftIcon.image
                         .withRenderingMode(.alwaysTemplate).withTintColor(.white))
                     .foregroundColor(.white)
                     .background(
                         Circle()
                             .foregroundColor(Color(Asset.Colors.teal.color))
                            .frame(width: backButtonSize, height: backButtonSize, alignment: .center)
                             .font(.system(size: 15))
                             .shadow(
                                color: Color.white.opacity(colorOpacity),
                                radius: shadowRadius,
                                x: -shadowXaxis,
                                y: -shadowYaxis
                             )
                             .shadow(
                                color: Color.black.opacity(colorOpacity),
                                radius: shadowRadius,
                                x: shadowXaxis,
                                y: shadowYaxis
                            )
                     )
            })
            .padding(.trailing, floor(backButtonSize / 2))

            Text(navigationTitle)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity)
            
            Button(action: {}, label: {
                Text(L10n.ChangePasswordPage.NavigationButtonItem.save)
                    .fontWeight(.bold)
                    .foregroundColor(.white).opacity(colorOpacity)
            })
        }
        .padding(.horizontal, horizontalMargin)
        .padding(.vertical, verticalMargin)
    }
}

struct NavigationHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationHeaderView(navigationTitle: L10n.ChangePasswordPage.navigationTitle)
            .background(Color(Asset.Colors.teal.color))
            .previewLayout(.sizeThatFits)
    }
}
