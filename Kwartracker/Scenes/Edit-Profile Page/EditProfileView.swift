//
//  EditProfileVIew.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 4/29/21.
//

import SwiftUI

struct EditProfileView: View {
    var body: some View {
        SkeletalView(header: {
            NavigationHeaderView(
                navigationTitle: L10n.EditProfilePage.navigationTitle,
                navigationButton: L10n.EditProfilePage.NavigationButtonItem.save
            )
        }, body: {
            EditProfileContentView()
        })
    }
}

struct EditProfileVIew_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
