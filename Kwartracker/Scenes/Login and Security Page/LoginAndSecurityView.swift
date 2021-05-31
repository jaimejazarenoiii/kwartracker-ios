//
//  LoginAndSecurityView.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 5/25/21.
//

import SwiftUI

struct LoginAndSecurityView: View {
    var body: some View {
        SkeletalView(header: {
            NavigationHeaderView(
                navigationTitle: L10n.SettingsPage.NavigationItem.loginAndSecurity,
                navigationButton: ""
            )
        }, body: {
            LoginAndSecuritBodyView()
        })
    }
}

struct LoginAndSecurityView_Previews: PreviewProvider {
    static var previews: some View {
        LoginAndSecurityView()
    }
}
