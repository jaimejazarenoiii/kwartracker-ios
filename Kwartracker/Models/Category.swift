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
        Category(
            id: 2,
            icon: nil,
            title: "Category 2",
            childCategories: [
                Category(id: 21, title: "Category 2 Sub 1"),
                Category(id: 22, title: "Category 2 Sub 2"),
                Category(id: 23, title: "Category 2 Sub 3"),
            ]
        ),
        Category(
            id: 3,
            icon: nil,
            title: "Category 3",
            childCategories: [
                Category(id: 31, title: "Category 3 Sub 1"),
                Category(id: 32, title: "Category 3 Sub 2"),
                Category(id: 33, title: "Category 3 Sub 3"),
            ]
        ),
    ]
    #endif
}
