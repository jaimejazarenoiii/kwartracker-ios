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
            TopRightButtonView(image: Asset.Images.editIcon.image, btnAction: {})
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
                TextGroupView(text: L10n.LoginAndSecurityPage.Label.email,
                          fontSize: fontSize,
                          bottomMargin: bottomMargin,
                          fontColor: Color(Asset.Colors.spindleGrey.color))
                TextGroupView(text: L10n.LoginAndSecurityPage.DummyData.email,
                          fontColor: Color(Asset.Colors.nightRider.color))
                TextGroupView(text: L10n.SignInPage.Label.password,
                          fontSize: fontSize,
                          bottomMargin: bottomMargin,
                          fontColor: Color(Asset.Colors.spindleGrey.color))
                TextGroupView(text: L10n.LoginAndSecurityPage.DummyData.password,
                          fontColor: Color(Asset.Colors.nightRider.color))

                ButtonView(actionHandler: {}, actionLabel: .changePassword)
                    .padding(.top)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
    }
}
