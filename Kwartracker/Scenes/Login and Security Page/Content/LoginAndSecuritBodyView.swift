//
//  LoginAndSecuritBodyView.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 5/25/21.
//

import SwiftUI

struct LoginAndSecuritBodyView: View {
    var body: some View {
        VStack {
            EditButtonView()
            LoginDetailsView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding()
    }
}

struct LoginAndSecuritBodyView_Previews: PreviewProvider {
    static var previews: some View {
        LoginAndSecuritBodyView()
    }
}

private struct LoginDetailsView: View {
    private let fontSize: CGFloat = 15
    private let bottomMargin: CGFloat = 8

    var body: some View {
        Group {
            VStack(alignment: .leading) {
                TextGroup(text: L10n.LoginAndSecurityPage.Label.email,
                          fontSize: fontSize,
                          bottomMargin: bottomMargin,
                          fontColor: Color(Asset.Colors.spindleGrey.color))
                TextGroup(text: L10n.LoginAndSecurityPage.DummyData.email,
                          fontSize: nil,
                          bottomMargin: nil,
                          fontColor: Color(Asset.Colors.nightRider.color))
                TextGroup(text: L10n.SignInPage.Label.password,
                          fontSize: fontSize,
                          bottomMargin: bottomMargin,
                          fontColor: Color(Asset.Colors.spindleGrey.color))
                TextGroup(text: L10n.LoginAndSecurityPage.DummyData.password,
                          fontSize: nil,
                          bottomMargin: nil,
                          fontColor: Color(Asset.Colors.nightRider.color))

                ButtonView(actionHandler: {}, actionLabel: .changePassword)
                    .padding(.top)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
    }
}

private struct TextGroup: View {
    let text: String
    let fontSize: CGFloat?
    let bottomMargin: CGFloat?
    let fontColor: Color
    
    private let defaultFontSize: CGFloat = 17
    private let defaultBottomMargin: CGFloat = 15

    var body: some View {
        Text(text)
            .font(Font.system(size: fontSize ?? defaultFontSize))
            .fontWeight(.bold)
            .padding(.bottom, bottomMargin ?? defaultBottomMargin)
            .foregroundColor(fontColor)
    }
}
