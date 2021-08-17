//
//  SettingsBodyView.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 5/24/21.
//

import SwiftUI

struct SettingsBodyView: View {
    @Binding var loginSecurityLinkIsActive: Bool
    @Binding var categoryLinkIsActive: Bool

    var body: some View {
        VStack(alignment: HorizontalAlignment.center, spacing: 20) {
            Spacer().frame(height: 30)

            NavigationItem(nagivationLabel: L10n.SettingsPage.NavigationItem.loginAndSecurity) {
                loginSecurityLinkIsActive = true
            }

            NavigationItem(nagivationLabel: L10n.SettingsPage.NavigationItem.categories) {
                categoryLinkIsActive = true
            }

            Spacer()
        }
        .padding([.leading, .trailing], 20)
    }
}

private struct NavigationItem: View {
    let nagivationLabel: String
    var onSelect: (() -> Void)

    private let fontSize: CGFloat = 14
    private let arrowButtonWidth: CGFloat = 8
    private let arrowButtonHeight: CGFloat = 13
    private let arrowIcon = Asset.Images.arrowRightIcon.image
        .withRenderingMode(.alwaysTemplate).withTintColor(.white)

    var body: some View {
        Button(action: onSelect) {
            HStack {
                Spacer()
                    .frame(width: 10)

                Text(nagivationLabel)
                    .foregroundColor(.white)
                    .font(.system(size: fontSize))
                    .bold()
                    .lineLimit(1)

                Spacer()

                Image(uiImage: arrowIcon)
                    .resizable()
                    .frame(width: arrowButtonWidth, height: arrowButtonHeight, alignment: .center)
                    .foregroundColor(.white)
            }
        }
        .buttonStyle(RoundedRectangleButtonStyle(buttonColor: Asset.Colors.teal.color))
    }
}
