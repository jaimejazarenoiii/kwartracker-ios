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
}

extension CategoryServiceDelegate {
    func getAllCategoryGroups() -> [CategoryGroup] {
        do {
            let realm = try Realm()
            return realm.objects(CategoryGroupObject.self).map { CategoryGroup(managedObject: $0) }
        } catch let error {
            DDLogError("[CategoryService] error: \(error.localizedDescription)")
        }
        return []
    }

    func saveFetched(data: CategoryGroupsQuery.Data?) -> [CategoryGroup] {
        guard let categoryGroups = data?.categoryGroups else { return [] }
        let categoryGroupsToSave = categoryGroups.map { CategoryGroup(group: $0) }
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(categoryGroupsToSave.map { $0.managedObject() }, update: .modified)
            }
            return categoryGroupsToSave
        } catch let error {
            DDLogError("[CategoryService] error: \(error.localizedDescription)")
        }
        return []
    }

    func save(categoryGroup data: AddParentCategoryMutation.Data?) -> CategoryGroup? {
        if let group = data?.addCategoryGroup,
           let id = Int(group.id) {
            let categoryGroup = CategoryGroup(id: id, title: group.title ?? "")
            do {
                let realm = try Realm()
                try realm.write {
                    realm.add(categoryGroup.managedObject())
                }
                return categoryGroup
            } catch let error {
                DDLogError("[CategoryService] error: \(error.localizedDescription)")
            }
        }
        return nil
    }

    func save(category data: AddCategoryMutation.Data?, categoryGroupId: Int) -> Category? {
        guard let categoryData = data?.addCategory, let id = Int(categoryData.id) else { return nil }
        do {
            let realm = try Realm()
            guard let cachedGroup = realm
                    .objects(CategoryGroupObject.self)
                    .first(where: { $0.id == categoryGroupId }) else { return nil }
            let category = Category(id: id, title: categoryData.title ?? "")
            try realm.write {
                cachedGroup.categories.append(category.managedObject())
                realm.add(cachedGroup, update: .modified)
            }
            return category
        } catch let error {
            DDLogError("[CategoryService] error: \(error.localizedDescription)")
        }
        return nil
    }
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
                            let savedCategoryGroup = save(categoryGroup: data)
                            promise(.success(savedCategoryGroup))
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
                        let category = save(category: data, categoryGroupId: categoryGroupId)
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
}
