//
//  Category.swift
//  Kwartracker
//
//  Created by Jacob on 4/26/21.
//

import Foundation

struct Category: Identifiable {
    var id: Int
    var icon: Imageable? = nil
    var title: String
    var childCategories: [Category] = []

    #if DEBUG
    static let dummyData = [
        Category(
            id: 1,
            icon: nil,
            title: "Category 1",
            childCategories: [
                Category(id: 11, title: "Category 1 Sub 1"),
                Category(id: 12, title: "Category 1 Sub 2"),
                Category(id: 13, title: "Category 1 Sub 3"),
            ]
        ),
    ]
    #endif
}
