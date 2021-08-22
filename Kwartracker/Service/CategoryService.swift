//
//  CategoryService.swift
//  Kwartracker
//
//  Created by Jacob on 8/7/21.
//

import Combine
import Apollo
import CocoaLumberjackSwift
import RealmSwift

enum ApiError: Error {
    case custom(description: String)
}

protocol CategoryServiceDelegate {
    func allCategoryGroupsRequest() -> AnyPublisher<[CategoryGroup], ApiError>
    func addParentCategory(title: String)
    -> AnyPublisher<CategoryGroup?, ApiError>
    func addCategory(categoryGroupId: Int, title: String)
    -> AnyPublisher<Category?, ApiError>
    func editCategoryGroup(categoryGroup: CategoryGroup)
    -> AnyPublisher<CategoryGroup?, ApiError>
    func editCategory(category: Category, groupId: Int, prevGroupId: Int)
    -> AnyPublisher<Category?, ApiError>
    func deleteCategoryGroup(id: Int)
    -> AnyPublisher<[CategoryGroup], ApiError>
    func deleteCategory(id: Int, groupId: Int)
    -> AnyPublisher<[Category], ApiError>
}

struct CategoryService: CategoryServiceDelegate {
    @discardableResult
    func allCategoryGroupsRequest() -> AnyPublisher<[CategoryGroup], ApiError> {
        Future<[CategoryGroup], ApiError> { promise in
            DDLogInfo("[CategoryService] fetch category groups")
            Network.shared.apollo
                .fetch(query: CategoryGroupsQuery()) { result in
                    do {
                        let errors = try result.get().errors
                        let data = try result.get().data
                        if let errors = errors {
                            DDLogError("[CategoryService] error: \(errors)")
                            let errorMessage = errors.map { $0.description }.joined(separator: "\n")
                            promise(.failure(.custom(description: errorMessage)))
                        } else {
                            DDLogInfo("[CategoryService] data: \(String(describing: data))")
                            let savedData = saveFetched(data: data)
                            promise(.success(savedData))
                        }
                    } catch let error {
                        let apiError = ApiError.custom(description: error.localizedDescription)
                        DDLogError("[CategoryService] error: \(apiError)")
                        promise(.failure(apiError))
                    }
                }
        }
        .eraseToAnyPublisher()
    }

    @discardableResult
    func addParentCategory(title: String)
    -> AnyPublisher<CategoryGroup?, ApiError> {
        Future<CategoryGroup?, ApiError> { promise in
            let input = AddCategoryGroupInput(title: title)
            DDLogInfo("[CategoryService] add parent category: \(input)")
            Network.shared.apollo
                .perform(mutation: AddParentCategoryMutation(input: input)) { result in
                    do {
                        let errors = try result.get().errors
                        let data = try result.get().data
                        if let errors = errors {
                            DDLogError("[CategoryService] error: \(errors)")
                            let errorMessage = errors.map { $0.description }.joined(separator: "\n")
                            promise(.failure(.custom(description: errorMessage)))
                        } else {
                            DDLogInfo("[CategoryService] data: \(String(describing: data))")
                            var categoryGroup: CategoryGroup? = nil
                            if let response = data?.addCategoryGroup {
                                categoryGroup = CategoryGroup(mutation: response)
                                add(categoryGroup: categoryGroup!)
                            }
                            promise(.success(categoryGroup))
                        }
                    } catch let error {
                        let apiError = ApiError.custom(description: error.localizedDescription)
                        DDLogError("[CategoryService] error: \(apiError)")
                        promise(.failure(apiError))
                    }
                }
        }
        .eraseToAnyPublisher()
    }

    @discardableResult
    func addCategory(categoryGroupId: Int, title: String)
    -> AnyPublisher<Category?, ApiError> {
        Future<Category?, ApiError> { promise in
            let input = AddCategoryInput(title: title, categoryGroupId: "\(categoryGroupId)")
            DDLogInfo("[CategoryService] add category: \(input)")
            Network.shared.apollo.perform(mutation: AddCategoryMutation(input: input)) { result in
                do {
                    if let errors = try result.get().errors {
                        DDLogError("[CategoryService] error: \(errors)")
                        let errorMessage = errors.map { $0.description }.joined(separator: "\n")
                        promise(.failure(.custom(description: errorMessage)))
                    } else {
                        let data = try result.get().data
                        DDLogInfo("[CategoryService] data: \(String(describing: data))")
                        var category: Category? = nil
                        if let response = data?.addCategory,
                           let id = Int(response.id) {
                            category = Category(id: id, title: response.title ?? "")
                            add(category: category!, groupId: categoryGroupId)
                        }
                        promise(.success(category))
                    }
                } catch let error {
                    DDLogError("[CategoryService] error: \(error.localizedDescription)")
                    let apiError = ApiError.custom(description: error.localizedDescription)
                    promise(.failure(apiError))
                }
            }
        }
        .eraseToAnyPublisher()
    }

    @discardableResult
    func editCategoryGroup(categoryGroup: CategoryGroup) -> AnyPublisher<CategoryGroup?, ApiError> {
        Future<CategoryGroup?, ApiError> { promise in
            let input = EditCategoryGroupInput(id: "\(categoryGroup.id)", title: categoryGroup.title)
            let mutation = EditParentCategoryMutation(input: input)
            DDLogInfo("[CategoryService] add parent category: \(input)")
            Network.shared.apollo
                .perform(mutation: mutation) { result in
                    do {
                        let errors = try result.get().errors
                        let data = try result.get().data
                        if let errors = errors {
                            DDLogError("[CategoryService] error: \(errors)")
                            let errorMessage = errors.map { $0.description }.joined(separator: "\n")
                            promise(.failure(.custom(description: errorMessage)))
                        } else {
                            DDLogInfo("[CategoryService] data: \(String(describing: data))")
                            var categoryGroup: CategoryGroup? = nil
                            if let response = data?.editCategoryGroup {
                                categoryGroup = CategoryGroup(mutation: response)
                                update(categoryGroup: categoryGroup!.id, title: categoryGroup!.title)
                            }
                            promise(.success(categoryGroup))
                        }
                    } catch let error {
                        let apiError = ApiError.custom(description: error.localizedDescription)
                        DDLogError("[CategoryService] error: \(apiError)")
                        promise(.failure(apiError))
                    }
                }
        }
        .eraseToAnyPublisher()
    }

    func editCategory(category: Category, groupId: Int, prevGroupId: Int) -> AnyPublisher<Category?, ApiError> {
        Future<Category?, ApiError> { promise in
            let input = EditCategoryInput(id: "\(category.id)",
                                          title: category.title,
                                          categoryGroupId: "\(groupId)")
            let mutation = EditCategoryMutation(input: input)
            Network.shared.apollo.perform(mutation: mutation) { result in
                do {
                    let errors = try result.get().errors
                    let data = try result.get().data
                    if let errors = errors {
                        DDLogError("[CategoryService] error: \(errors)")
                        let errorMessage = errors.map { $0.description }.joined(separator: "\n")
                        promise(.failure(.custom(description: errorMessage)))
                    } else {
                        DDLogInfo("[CategoryService] data: \(String(describing: data))")
                        var categoryResponse: Category? = nil
                        if let response = data?.editCategory {
                            categoryResponse = Category(id: category.id, title: response.title ?? "")
                            update(category: categoryResponse!.id,
                                   title: categoryResponse!.title,
                                   previousGroupId: prevGroupId,
                                   newGroupId: groupId)
                        }
                        promise(.success(categoryResponse))
                    }
                } catch let error {
                    let apiError = ApiError.custom(description: error.localizedDescription)
                    DDLogError("[CategoryService] error: \(apiError)")
                    promise(.failure(apiError))
                }
            }
        }
        .eraseToAnyPublisher()
    }

    func deleteCategoryGroup(id: Int)
    -> AnyPublisher<[CategoryGroup], ApiError> {
        Future<[CategoryGroup], ApiError> { promise in
            delete(categoryGroup: id)
            promise(.success([]))
        }
        .eraseToAnyPublisher()
    }

    func deleteCategory(id: Int, groupId: Int)
    -> AnyPublisher<[Category], ApiError> {
        Future<[Category], ApiError> { promise in
            delete(category: id, fromCategoryGroupId: groupId)
            promise(.success([]))
        }
        .eraseToAnyPublisher()
    }
}
