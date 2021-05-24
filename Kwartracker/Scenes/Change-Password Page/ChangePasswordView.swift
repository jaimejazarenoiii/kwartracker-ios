//
//  ChangePasswordView.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 4/15/21.
//

import SwiftUI

struct ChangePasswordView: View {
    var body: some View {
        SkeletalView(header: {
            NavigationHeaderView(navigationTitle: L10n.ChangePasswordPage.navigationTitle)
        }, body: {
            ChangePasswordBodyView()
        })
    }
}

struct ChangePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ChangePasswordView()
    }
}
