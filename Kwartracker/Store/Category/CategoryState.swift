//
//  CategoryState.swift
//  Kwartracker
//
//  Created by Jacob on 8/8/21.
//

import CocoaLumberjackSwift

struct CategoryState {
    // Category group list
    var searchCategory = ""
    var categoryListIsRequesting = false
    var categoryGroups = [CategoryGroup]()
    var categoryGroupListErrorMessage = ""

    // Add category
    var addCategoryIsRequesting = false
    var addCategoryErrorMessage: String?
    var addCategoryIsDone = false
    var isAddCategoryLinkActive = false
}
