//
//  NavigationHeaderView.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 4/15/21.
//

import SwiftUI

struct NavigationHeaderView: View {
    let navigationTitle: String
    let navigationButton: String

    var body: some View {
        NavigationContent(navigationTitle: navigationTitle, navigationButton: navigationButton)
    }
}

struct NavigationHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationHeaderView(
            navigationTitle: L10n.ChangePasswordPage.navigationTitle,
            navigationButton: L10n.ChangePasswordPage.NavigationButtonItem.save
        )
            .background(Color(Asset.Colors.teal.color))
            .previewLayout(.sizeThatFits)
    }
}

private struct NavigationContent: View {
    let navigationTitle: String
    let navigationButton: String
    let horizontalMargin: CGFloat = 40
    let verticalMargin: CGFloat = 20
    let colorOpacity: Double = 0.3
    let shadowRadius: CGFloat = 5
    let shadowXaxis: CGFloat = 8
    let shadowYaxis: CGFloat = 5
    let backButtonSize: CGFloat = 35
    
    var body: some View {
        HStack {
            Button(action: {}, label: {
                 Image(uiImage: Asset.Images.arrowLeftIcon.image
                         .withRenderingMode(.alwaysTemplate).withTintColor(.white))
                     .foregroundColor(.white)
                     .background(
                         Circle()
                             .foregroundColor(Color(Asset.Colors.teal.color))
                            .frame(
                                width: backButtonSize,
                                height: backButtonSize,
                                alignment: .center
                            )
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
                Text(navigationButton)
                    .fontWeight(.bold)
                    .foregroundColor(.white).opacity(colorOpacity)
            })
        }
        .padding(.horizontal, horizontalMargin)
        .padding(.vertical, verticalMargin)
    }
}
