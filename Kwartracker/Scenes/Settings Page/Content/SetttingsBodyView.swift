//
//  SetttingsBodyView.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 5/24/21.
//

import SwiftUI

struct SetttingsBodyView: View {
    @State var isCategoryLinkActive = false
    @State var isLoginSecurityLinkActive = false

    var body: some View {
        NavigationView {
            VStack {
                Spacer().frame(height: 30)
                NavigationItem(isActive: $isLoginSecurityLinkActive,
                               nagivationLabel: L10n.SettingsPage.NavigationItem.loginAndSecurity)
                NavigationItem(isActive: $isCategoryLinkActive,
                               nagivationLabel: L10n.SettingsPage.NavigationItem.categories)
                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
}

struct SetttingsBodyView_Previews: PreviewProvider {
    static var previews: some View {
        SetttingsBodyView()
    }
}

private struct NavigationItem: View {
    @Binding var isActive: Bool
    let nagivationLabel: String
    private let shadowRadius: CGFloat = 8
    private let shadowOffset = CGPoint(x: 6, y: 6)
    private let rectRadius: CGFloat = 15
    private let fontSize: CGFloat = 14
    private let arrowButtonWidth: CGFloat = 8
    private let arrowButtonHeight: CGFloat = 13
    private let nagivationButtonSpacing: CGFloat = 5
    private let nagivationContentMargin: CGFloat = 30
    let arrowIcon = Asset.Images.arrowRightIcon.image.withRenderingMode(.alwaysTemplate).withTintColor(.white)

    var body: some View {
        ZStack {
            Button(action: { isActive.toggle() }) {
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
        .background(
            NavigationLink(destination: Text(nagivationLabel), isActive: $isActive) {
                EmptyView()
            }.hidden()
        )
    }
}
