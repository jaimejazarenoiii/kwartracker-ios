//
//  CategoryGroup.swift
//  Kwartracker
//
//  Created by Jacob on 8/8/21.
//

struct CategoryGroup {
    var id: Int
    var title: String
    var categories: [Category]

    init(id: Int,
         title: String,
         categories: [Category] = []) {
        self.id = id
        self.title = title
        self.categories = categories
    }
}

extension CategoryGroup {
    static let dummyCategoryGroup = [
        CategoryGroup(id: 1, title: "Food"),
        CategoryGroup(id: 2, title: "Transportation"),
        CategoryGroup(id: 3, title: "Household"),
        CategoryGroup(id: 4, title: "Other 1", categories: [
            Category(id: 1, title: "Other 1.1"),
            Category(id: 2, title: "Other 1.2"),
            Category(id: 3, title: "Other 1.3"),
        ]),
        CategoryGroup(id: 5, title: "Other 2", categories: [
            Category(id: 4, title: "Other 2.1"),
            Category(id: 5, title: "Other 2.2"),
            Category(id: 6, title: "Other 2.3"),
        ])
    ]
}

extension CategoryGroup: Persistable {
    init(managedObject: CategoryGroupObject) {
        id = managedObject.id
        title = managedObject.title
        categories = managedObject.categories.map { Category(managedObject: $0) }
    }

    func managedObject() -> CategoryGroupObject {
        let categoryGroup = CategoryGroupObject()
        categoryGroup.id = id
        categoryGroup.title = title
        if !categories.isEmpty {
            categoryGroup.categories.append(objectsIn: categories.map { $0.managedObject() })
        }
        return categoryGroup
    }
}

extension Array where Element == CategoryGroup {
    func sortedByTitle() -> [CategoryGroup] {
        sorted(by: { $0.title > $1.title })
    }

    func sortedById() -> [CategoryGroup] {
        sorted(by: { $0.id > $1.id })
    }

    func filterBy(term: String) -> [CategoryGroup] {
        let termLowerCased = term.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        if termLowerCased.isEmpty {
            return self
        } else {
            return filter {
                $0.categories
                    .contains { $0.title.lowercased().contains(termLowerCased) }
            }
        }
    }
}

extension CategoryGroup {
    init(group: CategoryGroupsQuery.Data.CategoryGroup) {
        id = Int(group.id) ?? 0
        title = group.title ?? ""
        categories = (group.categories ?? []).map { Category(category: $0) }
    }

    init(mutation data: AddParentCategoryMutation.Data.AddCategoryGroup) {
        id = Int(data.id) ?? 0
        title = data.title ?? ""
        categories = []
    }

    init(mutation data: EditParentCategoryMutation.Data.EditCategoryGroup) {
        id = Int(data.id) ?? 0
        title = data.title ?? ""
        categories = (data.categories ?? [])
            .filter { Int($0.id) != nil }
            .map {
                Category(id: Int($0.id) ?? 0, title: $0.title ?? "")
            }
    }
}
