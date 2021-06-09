//
//  CategoryView.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 5/27/21.
//

import SwiftUI

struct CategoryView: View {
    var body: some View {
        SkeletalView(header: {
            NavigationHeaderView(
                navigationTitle: L10n.SettingsPage.NavigationItem.categories,
                navigationButton: ""
            )
        }, body: {
            CategoryBodyView()
        })
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
