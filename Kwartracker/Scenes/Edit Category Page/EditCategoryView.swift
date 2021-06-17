//
//  EditCategoryView.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 6/1/21.
//

import SwiftUI

struct EditCategoryView: View {
    @State var categoryName = L10n.CategoryDetailPage.navigationTitle

    var body: some View {
        SkeletalView(header: {
            NavigationHeaderView(
                navigationTitle: categoryName,
                navigationButton: L10n.EditProfilePage.NavigationButtonItem.save
            )
        }, body: {
            EditCategoryBodyView()
        })
    }
}

struct EditCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        EditCategoryView()
    }
}
