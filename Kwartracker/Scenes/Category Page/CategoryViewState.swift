//
//  CategoryViewState.swift
//  Kwartracker
//
//  Created by Jacob on 7/12/21.
//

import SwiftUI
import Combine

struct CategoryViewState {
    var categories: [Category] = []
    var searchTerm: String = ""
    var fetchedCategories: [Category] = []
}

extension Category {
    func filterBy(keyword: String) -> Bool {
        let keywordInLowerCase = keyword.lowercased()
        let titleInLowerCase = title.lowercased()
        return titleInLowerCase.hasPrefix(keywordInLowerCase)
    }
}

enum CategoryViewAction {
    case categorySearch(term: String)
    case commitCategorySearch
    case pullToRefreshCategories
    case loadMoreCategories
}

func categoryViewReducer(
    state: inout CategoryViewState,
    action: CategoryViewAction,
    environment: World
) -> AnyPublisher<CategoryViewAction, Never> {
    switch action {
    case .categorySearch(let term):
        // Local search from fetched categories
        let filteredCategory = state.fetchedCategories
            .filter { term.isEmpty ? true : $0.filterBy(keyword: term) }
        state.searchTerm = term
        state.categories = filteredCategory
        break
    case .commitCategorySearch:
        // Run api request here
        break
    case .pullToRefreshCategories:
        break
    case .loadMoreCategories:
        break
    }
    return Empty().eraseToAnyPublisher()
}
