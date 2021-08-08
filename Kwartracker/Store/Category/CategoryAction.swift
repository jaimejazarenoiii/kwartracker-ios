//
//  CategoryAction.swift
//  Kwartracker
//
//  Created by Jacob on 8/8/21.
//

enum CategoryAction {
    // Category list
    case getAllCategoryGroupsRequest
    case getAllCategoryGroupsHandleResponse(response: [CategoryGroup])
    case getAllCategoryGroupsHandleError(error: ApiError)
    case getAllCategoryGroups

    // Add category group
    case parentCategoryAddRequest(title: String)
    case parentCategoryHandleResponse(response: CategoryGroup?)
    case parentCategoryHandleError(error: ApiError)
}
