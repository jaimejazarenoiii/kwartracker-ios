//
//  LoginAndSecurityView.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 5/25/21.
//

import SwiftUI

struct LoginAndSecurityView: View {
    var navigationBackAction: (() -> ())
    @State private var isChangePasswordLinkActive = false
    var body: some View {
        ZStack {
            SkeletalView(
                header: { header },
                body: {
                    LoginAndSecuritBodyView(isChangePasswordLinkActive: $isChangePasswordLinkActive)
            })
            .navigationBarHidden(true)

            NavigationLink(
                destination: ChangePasswordView(
                    navigationBackAction: { isChangePasswordLinkActive = false }),
                isActive: $isChangePasswordLinkActive) {
                EmptyView()
            }
        }
    }

    private var header: some View {
        NavigationBarView(
            title: L10n.SettingsPage.NavigationItem.loginAndSecurity,
            leftBarViewContent: {
                Button(action: navigationBackAction) {
                    Image(uiImage: Asset.Images.arrowLeftIconWhite.image)
                        .frame(width: 10, height: 10)
                }
                .buttonStyle(CircleButtonStyle(buttonColor: Asset.Colors.teal.color))
            },
            rightBarViewContent: { EmptyView() }
        )
    }
}

struct LoginAndSecurityView_Previews: PreviewProvider {
    static var previews: some View {
        LoginAndSecurityView(navigationBackAction: {})
    }
}
