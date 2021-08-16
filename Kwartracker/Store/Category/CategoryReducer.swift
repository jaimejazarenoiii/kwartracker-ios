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
    case .parentCategoryAddRequest(let title):
        state.addCategoryIsRequesting = true
        return environment.categoryService.addParentCategory(title: title)
            .map { .parentCategoryHandleResponse(response: $0) }
            .catch { Just(.parentCategoryHandleError(error: $0)) }
            .eraseToAnyPublisher()
    case .parentCategoryHandleResponse(let response):
        state.addCategoryIsRequesting = false
        if let addCategoryGroup = response?.addCategoryGroup {
            let categoryGroup = CategoryGroup(id: addCategoryGroup.id.hashValue,
                                              title: addCategoryGroup.title ?? "")
            do {
                let realm = try Realm()
                try realm.write {
                    realm.add(categoryGroup.managedObject())
                }
            } catch let error {
                DDLogError("[CategoryReducer] error: \(error.localizedDescription)")
            }
        }
        break
    case .parentCategoryHandleError(let error):
        state.addCategoryIsRequesting = false
        state.addCategoryErrorMessage = error.localizedDescription
        break
    default: break
    }
    return Empty().eraseToAnyPublisher()
}
