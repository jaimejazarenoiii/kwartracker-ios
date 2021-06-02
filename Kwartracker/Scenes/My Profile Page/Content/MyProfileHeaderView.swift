//
//  MyProfileHeaderView.swift
//  Kwartracker
//
//  Created by John Ellie Go on 6/2/21.
//

import SwiftUI

struct MyProfileHeaderView: View {
    private let bottomPadding: CGFloat = -10
    var body: some View {
        NavigationHeaderView(
            navigationTitle: L10n.ProfilePage.title,
            navigationButton: ""
        )
        .padding(.bottom, bottomPadding)
    }
}

struct MyProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MyProfileHeaderView()
    }
}
