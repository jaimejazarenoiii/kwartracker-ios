//
//  BudgetObject.swift
//  Kwartracker
//
//  Created by Jacob on 8/8/21.
//

import Foundation
import RealmSwift

class BudgetObject: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var amount: Double = 0
    @objc dynamic var category: CategoryObject?
    @objc dynamic var createdAt: Date = Date()
    @objc dynamic var updatedAt: Date = Date()

    override static func primaryKey() -> String? {
        "id"
    }
}
