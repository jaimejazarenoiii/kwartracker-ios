//
//  CategoryService+Realm.swift
//  Kwartracker
//
//  Created by Jacob on 8/22/21.
//

import CocoaLumberjackSwift
import RealmSwift

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

    func add(categoryGroup: CategoryGroup) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(categoryGroup.managedObject())
            }
        } catch let error {
            DDLogError("[CategoryService] error: \(error.localizedDescription)")
        }
    }

    func add(category: Category,
             groupId: Int) {
        do {
            let realm = try Realm()
            guard let cachedItem = realm.objects(CategoryGroupObject.self)
                    .first(where: { $0.id == groupId }) else { return }
            try realm.write {
                cachedItem.categories.append(category.managedObject())
                realm.add(cachedItem, update: .modified)
            }
        } catch let error {
            DDLogError("[CategoryService] error: \(error.localizedDescription)")
        }
    }

    func delete(category id: Int,
                fromCategoryGroupId: Int) {
        do {
            let realm = try Realm()
            guard let cachedGroup = realm.objects(CategoryGroupObject.self)
                    .first(where: { $0.id == fromCategoryGroupId }),
                  let index = cachedGroup.categories.firstIndex(where: { $0.id == id })
            else { return }
            try realm.write {
                let category = cachedGroup.categories[index]
                realm.delete(category)
            }
        } catch let error {
            DDLogError("[CategoryService] error: \(error.localizedDescription)")
        }
    }

    func delete(categoryGroup id: Int) {
        do {
            let realm = try Realm()
            guard let cachedGroup = realm.objects(CategoryGroupObject.self)
                    .first(where: { $0.id == id })
            else { return }
            let categories = cachedGroup.categories
            try realm.write {
                realm.delete(categories)
                realm.delete(cachedGroup)
            }
        } catch let error {
            DDLogError("[CategoryService] error: \(error.localizedDescription)")
        }
    }

    func update(category id: Int,
                title: String,
                previousGroupId: Int,
                newGroupId: Int) {
        // Delete
        delete(category: id, fromCategoryGroupId: previousGroupId)
        do {
            let realm = try Realm()
            guard let cachedGroup = realm.objects(CategoryGroupObject.self).first(where: { $0.id == newGroupId })
            else { return }
            try realm.write {
                let category = Category(id: id, title: title)
                cachedGroup.categories.append(category.managedObject())
                realm.add(cachedGroup, update: .modified)
            }
        } catch let error {
            DDLogError("[CategoryService] error: \(error.localizedDescription)")
        }
    }

    func update(categoryGroup id: Int,
                title: String) {
        do {
            let realm = try Realm()
            guard let cachedItem = realm.objects(CategoryGroupObject.self)
                    .first(where: { $0.id == id }) else { return }
            try realm.write {
                cachedItem.title = title
                realm.add(cachedItem, update: .modified)
            }
        } catch let error {
            DDLogError("[CategoryService] error: \(error.localizedDescription)")
        }
    }
}
