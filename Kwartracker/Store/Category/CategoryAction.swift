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

    // Add category
    case addCategoryRequest(title: String, categoryGroupId: Int)
    case addCategoryHandleResponse(response: Category?)
    case addCategoryHandleError(error: ApiError)
    case addCategoryLinkActive(active: Bool)

    // Edit category
    case editCategoryGroupRequest(categoryGroup: CategoryGroup)
    case editCategoryGroupHandleResponse(response: CategoryGroup?)
    case editCategoryGroupHandleError(error: ApiError)
    case editCategoryRequest(category: Category, groupId: Int, previousGroupId: Int)
    case editCategoryHandleResponse(response: Category?)
    case editCategoryHandleError(error: ApiError)
    case setEditCategoryLink(active: Bool)

    // Category Detail
    case setCategoryDetailLinkActive(active: Bool)
    case deleteCategoryGroup(id: Int)
    case deleteCategory(id: Int, groupId: Int)
    case deleteCategoryHandleResponse
    case deleteCategoryhandleError(error: ApiError)
}
