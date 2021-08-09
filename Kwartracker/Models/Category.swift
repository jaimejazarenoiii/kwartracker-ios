//
//  Category.swift
//  Kwartracker
//
//  Created by Jacob on 4/26/21.
//

import Foundation

struct Category: Identifiable {
    var id: Int
    var title: String
    var budgets: [Budget]
    var transactions: [Transaction]

    init(id: Int,
         title: String,
         budgets: [Budget] = [],
         transactions: [Transaction] = []) {
        self.id = id
        self.title = title
        self.budgets = budgets
        self.transactions = transactions
    }
}

extension Category: Persistable {
    init(managedObject: CategoryObject) {
        id = managedObject.id
        title = managedObject.title
        budgets = managedObject.budgets.map { Budget(managedObject: $0) }
        transactions = []
    }

    func managedObject() -> CategoryObject {
        let category = CategoryObject()
        category.id = id
        category.title = title
        return category
    }
}

extension Array where Element == Category {
    func sortedByTitle() -> [Category] {
        sorted(by: { $0.title > $1.title })
    }

    func sortedById() -> [Category] {
        sorted(by: { $0.id > $1.id })
    }

    func filterBy(term: String) ->[Category] {
        filter {
            term.isEmpty ? true :
                $0.title.lowercased().contains(term.lowercased())
        }
    }
}

extension Category {
    init(category: CategoryGroupsQuery.Data.CategoryGroup.Category) {
        id = Int(category.id) ?? 0
        title = category.title ?? ""
        budgets = []
        transactions = []
    }
}
