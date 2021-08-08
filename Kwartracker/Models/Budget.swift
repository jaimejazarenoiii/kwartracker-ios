//
//  Budget.swift
//  Kwartracker
//
//  Created by Jacob on 8/8/21.
//

import Foundation

struct Budget {
    var id: Int
    var amount: Double
    var category: Category?
    var createdAt: Date
    var updatedAt: Date

    init(id: Int,
         amount: Double = 0,
         category: Category? = nil,
         createdAt: Date = Date(),
         updatedAt: Date = Date()) {
        self.id = id
        self.amount = amount
        self.category = category
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}

extension Budget: Persistable {
    init(managedObject: BudgetObject) {
        id = managedObject.id
        amount = managedObject.amount
        if let categoryObject = managedObject.category {
            self.category = Category(managedObject: categoryObject)
        }
        createdAt = managedObject.createdAt
        updatedAt = managedObject.updatedAt
    }

    func managedObject() -> BudgetObject {
        let budget = BudgetObject()
        budget.id = id
        budget.amount = amount
        budget.category = category?.managedObject()
        budget.createdAt = createdAt
        budget.updatedAt = updatedAt
        return budget
    }
}
