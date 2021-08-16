//
//  CategoryBodyView.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 5/27/21.
//

import SwiftUI

struct CategoryBodyView: View {
    @EnvironmentObject private var store: AppStore
    @State var search = ""
    
    private let shadowRadius: CGFloat = 8
    private let shadowOffset = CGPoint(x: 6, y: 6)
    private let rectRadius: CGFloat = 17
    private let searchButtonSize: CGFloat = 20
    private let bottomMargin: CGFloat = 8
    private let bodyMargin: CGFloat = 0

    let categoryGroups = CategoryGroup.dummyCategoryGroup
    
    var body: some View {
        VStack {
            let searchBinding = Binding<String>(
                get: { search },
                set: {
                    search = $0
                    store.send(.categoryView(action: .categorySearch(term: search)))
                }
            )
            SearchFieldView(searchTerm: searchBinding)
                .padding(.bottom, 10)
                .padding([.top, .leading, .trailing], 30)

            ScrollView(.vertical, showsIndicators: false) {
                ForEach(categoryGroups, id: \.id) { categoryGroup in
                    let categories = categoryGroup.categories
                    CategoryListView(
                        title: categoryGroup.title,
                        subCategory: categories.isEmpty ? nil : categories
                    )
                    .padding([.top, .bottom], 10)
                }
                .padding(.top, 10)
                .padding([.leading, .trailing], 20)
            }
        }
    }
}

struct CategoryBodyView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryBodyView()
    }
}
