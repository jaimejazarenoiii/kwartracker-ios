//
//  SettingsView.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 5/24/21.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        SkeletalView(header: {
            NavigationHeaderView(
                navigationTitle: L10n.SettingsPage.navigationTitle,
                navigationButton: ""
            )
        }, body: {
            SettingsBodyView()
        })
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
