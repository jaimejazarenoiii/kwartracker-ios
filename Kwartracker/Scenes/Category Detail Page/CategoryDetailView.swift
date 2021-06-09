//
//  CategoryDetailView.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 5/31/21.
//

import SwiftUI

struct CategoryDetailView: View {
    @State var categoryName = L10n.CategoryDetailPage.navigationTitle

    var body: some View {
        SkeletalView(header: {
            NavigationHeaderView(
                navigationTitle: categoryName,
                navigationButton: ""
            )
        }, body: {
            CategoryDetailBodyView(categoryName: categoryName)
        })
    }
}

struct CategoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetailView(categoryName: L10n.CategoryDetailPage.navigationTitle)
    }
}
