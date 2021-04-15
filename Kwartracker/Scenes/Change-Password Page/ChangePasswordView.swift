//
//  ChangePasswordView.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 4/15/21.
//

import SwiftUI

struct ChangePasswordView: View {
    var body: some View {
        MainView {
            NavigationHeaderView(navigationTitle: "Change Password")
                .padding(.bottom, -20)
        } content: {
            ChangePasswordBodyView()
        }
    }
}

struct ChangePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ChangePasswordView()
    }
}
