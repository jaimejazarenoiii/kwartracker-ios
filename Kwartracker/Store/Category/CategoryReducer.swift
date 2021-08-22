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
        state.addCategoryIsDone = true
        state.addCategoryIsRequesting = false
        state.categoryGroups = environment.categoryService.getAllCategoryGroups()
        state.isAddCategoryLinkActive = false
        break
    case .parentCategoryHandleError(let error):
        state.addCategoryIsRequesting = false
        state.addCategoryErrorMessage = error.localizedDescription
        break
    case .addCategoryRequest(let title, let categoryGroupId):
        state.addCategoryIsRequesting = true
        return environment.categoryService.addCategory(categoryGroupId: categoryGroupId, title: title)
            .map { CategoryAction.addCategoryHandleResponse(response: $0) }
            .catch { Just(.addCategoryHandleError(error: $0)) }
            .eraseToAnyPublisher()
    case .addCategoryHandleResponse:
        state.addCategoryIsRequesting = false
        state.categoryGroups = environment.categoryService.getAllCategoryGroups()
        state.addCategoryIsDone = true
        state.isAddCategoryLinkActive = false
        break
    case .addCategoryHandleError(let error):
        state.addCategoryIsRequesting = false
        state.addCategoryErrorMessage = error.localizedDescription
        break
    case .addCategoryLinkActive(let active):
        state.isAddCategoryLinkActive = active
        break
    case .editCategoryGroupRequest(let categoryGroup):
        state.addCategoryIsRequesting = true
        return environment.categoryService.editCategoryGroup(categoryGroup: categoryGroup)
            .map { CategoryAction.editCategoryGroupHandleResponse(response: $0) }
            .catch { Just(.editCategoryGroupHandleError(error: $0)) }
            .eraseToAnyPublisher()
    case .editCategoryGroupHandleResponse:
        state.addCategoryIsRequesting = false
        state.categoryGroups = environment.categoryService.getAllCategoryGroups()
        state.addCategoryIsDone = true
        state.isCategoryDetailLinkActive = false
        break
    case .editCategoryGroupHandleError(let error):
        state.addCategoryIsRequesting = false
        state.addCategoryErrorMessage = error.localizedDescription
        break
    case .editCategoryRequest(let category, let groupId, let prevGroupId):
        state.addCategoryIsRequesting = true
        return environment.categoryService
            .editCategory(category: category,
                          groupId: groupId,
                          prevGroupId: prevGroupId)
            .map { CategoryAction.editCategoryHandleResponse(response: $0) }
            .catch { Just(.editCategoryHandleError(error: $0)) }
            .eraseToAnyPublisher()
    case .editCategoryHandleResponse:
        state.addCategoryIsRequesting = false
        state.categoryGroups = environment.categoryService.getAllCategoryGroups()
        state.addCategoryIsDone = true
        state.isCategoryDetailLinkActive = false
        break
    case .editCategoryHandleError(let error):
        state.addCategoryIsRequesting = false
        state.addCategoryErrorMessage = error.localizedDescription
        break
    case .setEditCategoryLink(let active):
        state.isEditCategoryLinkActive = active
        break
    case .setCategoryDetailLinkActive(let active):
        state.isCategoryDetailLinkActive = active
        break
    case .deleteCategoryGroup(let id):
        return environment.categoryService.deleteCategoryGroup(id: id)
            .map { _ in CategoryAction.deleteCategoryHandleResponse }
            .catch { Just(.deleteCategoryhandleError(error: $0)) }
            .eraseToAnyPublisher()
    case .deleteCategory(let id, let groupId):
        return environment.categoryService.deleteCategory(id: id, groupId: groupId)
            .map { _ in CategoryAction.deleteCategoryHandleResponse }
            .catch { Just(.deleteCategoryhandleError(error: $0)) }
            .eraseToAnyPublisher()
    case .deleteCategoryHandleResponse:
        state.categoryGroups = environment.categoryService.getAllCategoryGroups()
        state.isCategoryDetailLinkActive = false
        break
    case .deleteCategoryhandleError(let error):
        state.addCategoryErrorMessage = error.localizedDescription
        break
    }
    return Empty().eraseToAnyPublisher()
}
