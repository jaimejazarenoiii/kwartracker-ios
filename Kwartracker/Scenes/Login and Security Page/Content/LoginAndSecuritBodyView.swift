//
//  LoginAndSecuritBodyView.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 5/25/21.
//

import SwiftUI

struct LoginAndSecuritBodyView: View {
    @Binding var isChangePasswordLinkActive: Bool
    var body: some View {
        VStack {
            TopRightButtonView(image: Asset.Images.editIcon.image, btnAction: {})
            LoginDetailsView(isChangePasswordLinkActive: $isChangePasswordLinkActive)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding()
    }
}

struct LoginAndSecuritBodyView_Previews: PreviewProvider {
    static var previews: some View {
        LoginAndSecuritBodyView(isChangePasswordLinkActive: .constant(false))
    }
}

private struct LoginDetailsView: View {
    @Binding var isChangePasswordLinkActive: Bool

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

                Button(action: {
                    isChangePasswordLinkActive = true
                }) {
                    HStack {
                        Spacer()
                        Text(L10n.ChangePasswordPage.navigationTitle)
                            .foregroundColor(.white)
                        Spacer()
                    }
                }
                .buttonStyle(RoundedRectangleButtonStyle(buttonColor: Asset.Colors.teal.color))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
    }
}
