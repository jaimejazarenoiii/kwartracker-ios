//
//  CategoryBodyView.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 5/27/21.
//

import SwiftUI
import CocoaLumberjackSwift

struct CategoryBodyView: View {
    @EnvironmentObject private var store: AppStore
    @State var search = ""
    @State var selectedData: (group: CategoryGroup, category: Category?)? = nil

    @State private var detailLinkIsActive = false
    
    private let shadowRadius: CGFloat = 8
    private let shadowOffset = CGPoint(x: 6, y: 6)
    private let rectRadius: CGFloat = 17
    private let searchButtonSize: CGFloat = 20
    private let bottomMargin: CGFloat = 8
    private let bodyMargin: CGFloat = 0

    
    var body: some View {
        VStack {
            SearchFieldView(onCommitAction: performSearch,
                            searchTerm: $search)
                .padding(.bottom, 10)
                .padding([.top, .leading, .trailing], 30)

            ScrollView(.vertical, showsIndicators: false) {
                ForEach(categoryGroupsResult(), id: \.id) { categoryGroup in
                    CategoryGroupView(
                        categoryGroup: categoryGroup,
                        onSelect: { onSelect(categoryGroup: $0, category: nil) }
                    )
                    .padding([.top, .bottom], 10)
                    if !categoryGroup.categories.isEmpty {
                        CategoriesView(
                            categories: categoryGroup.categories,
                            onSelect: { onSelect(categoryGroup: nil, category: $0) }
                        )
                    }
                }
                .padding(.top, 10)
                .padding([.leading, .trailing], 20)
            }

            NavigationLink(
                // will change the destination to category detail view
                destination: TransactionDetailView(transaction: .unitTestTransaction),
                isActive: $detailLinkIsActive,
                label: { EmptyView() }
            )
            .hidden()
        }
        .onAppear(perform: fetchCategoryGroup)
    }

    private func fetchCategoryGroup() {
        store.send(.category(action: .getAllCategoryGroups))
        store.send(.category(action: .getAllCategoryGroupsRequest))
    }

    private func categoryGroupsResult() -> [CategoryGroup] {
        store.state.categoryState.categoryGroups.filterBy(term: search)
    }

    private func performSearch() {
        DDLogInfo("[CategorySearch] perform search")
    }

    private func onSelect(categoryGroup: CategoryGroup?, category: Category?) {
        debugPrint("test: \(categoryGroup) || \(category)")
        detailLinkIsActive = true
    }
}

struct CategoryBodyView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryBodyView()
    }
}
