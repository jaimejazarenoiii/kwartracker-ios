//
//  CategoryAction.swift
//  Kwartracker
//
//  Created by Jacob on 8/8/21.
//

enum CategoryAction {
    case parentCategoryAddRequest(title: String)
    case parentCategoryHandleResponse(response: AddParentCategoryMutation.Data?)
    case parentCategoryHandleError(error: ApiError)
}
