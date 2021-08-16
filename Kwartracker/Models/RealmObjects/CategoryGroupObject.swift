//
//  CategoryGroupObject.swift
//  Kwartracker
//
//  Created by Jacob on 8/8/21.
//

import Foundation
import RealmSwift

class CategoryGroupObject: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var title: String = ""
    var categories = List<CategoryObject>()

    override static func primaryKey() -> String? {
        "id"
    }
}
