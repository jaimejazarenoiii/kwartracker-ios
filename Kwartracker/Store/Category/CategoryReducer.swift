//
//  CategoryReducer.swift
//  Kwartracker
//
//  Created by Jacob on 8/8/21.
//

import Combine
import RealmSwift
import CocoaLumberjackSwift

func categoryReducer(
    state: inout CategoryState,
    action: CategoryAction,
    environment: World
) -> AnyPublisher<CategoryAction, Never> {
    switch action {
    case .getAllCategoryGroupsRequest:
        state.categoryListIsRequesting = true
        return environment.categoryService.allCategoryGroupsRequest()
            .map { CategoryAction.getAllCategoryGroupsHandleResponse(response: $0) }
            .catch { Just(.getAllCategoryGroupsHandleError(error: $0)) }
            .eraseToAnyPublisher()
    case .getAllCategoryGroupsHandleResponse:
        state.categoryListIsRequesting = false
        state.categoryGroups = environment.categoryService.getAllCategoryGroups()
        break
    case .getAllCategoryGroupsHandleError(let error):
        state.categoryListIsRequesting = false
        state.categoryGroupListErrorMessage = error.localizedDescription
        break
    case .getAllCategoryGroups:
        state.categoryGroups = environment.categoryService.getAllCategoryGroups()
        break
    case .parentCategoryAddRequest(let title):
        state.addCategoryIsRequesting = true
        return environment.categoryService.addParentCategory(title: title)
            .map { .parentCategoryHandleResponse(response: $0) }
            .catch { Just(.parentCategoryHandleError(error: $0)) }
            .eraseToAnyPublisher()
    case .parentCategoryHandleResponse:
        state.addCategoryIsRequesting = false
        state.categoryGroups = environment.categoryService.getAllCategoryGroups()   
        break
    case .parentCategoryHandleError(let error):
        state.addCategoryIsRequesting = false
        state.addCategoryErrorMessage = error.localizedDescription
        break
    }
    return Empty().eraseToAnyPublisher()
}
