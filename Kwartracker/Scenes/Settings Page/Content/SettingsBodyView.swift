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
        VStack {
            Spacer().frame(height: 30)

            NavigationItem(nagivationLabel: L10n.SettingsPage.NavigationItem.loginAndSecurity) {
                loginSecurityLinkIsActive = true
            }

            NavigationItem(nagivationLabel: L10n.SettingsPage.NavigationItem.categories) {
                categoryLinkIsActive = true
            }

            Spacer()
        }
    }
}

private struct NavigationItem: View {
    let nagivationLabel: String
    var onSelect: (() -> Void)
    
    private let shadowRadius: CGFloat = 8
    private let shadowOffset = CGPoint(x: 6, y: 6)
    private let rectRadius: CGFloat = 15
    private let fontSize: CGFloat = 14
    private let arrowButtonWidth: CGFloat = 8
    private let arrowButtonHeight: CGFloat = 13
    private let nagivationButtonSpacing: CGFloat = 5
    private let nagivationContentMargin: CGFloat = 30
    private let arrowIcon = Asset.Images.arrowRightIcon.image
        .withRenderingMode(.alwaysTemplate).withTintColor(.white)

    var body: some View {
        ZStack {
            Button(action: onSelect) {
                ZStack {
                    BWNeumorphicRectangle(rectRadius: rectRadius,
                                          color: Color(Asset.Colors.teal.color),
                                          shadowRadius: shadowRadius,
                                          shadowOffset: shadowOffset)
                    HStack {
                        Text(nagivationLabel)
                            .foregroundColor(.white)
                            .font(.system(size: fontSize))
                            .bold()
                        Spacer()
                        Image(uiImage: arrowIcon)
                            .resizable()
                            .frame(width: arrowButtonWidth, height: arrowButtonHeight, alignment: .center)
                            .foregroundColor(.white)
                    }
                    .padding()
                }
                .padding(.horizontal, nagivationContentMargin)
                .padding(.vertical, nagivationButtonSpacing)
            }
        }
    }
}
