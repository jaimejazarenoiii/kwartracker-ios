//
//  Category.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 5/31/21.
//

import Foundation

struct Category: Hashable {
    var categoryId: Int
    var categoryName: String
    var subCaetgories: [SubCategory]
    
    #if DEBUG
    static let dummyData = [
        Category(categoryId: 1,
                  categoryName: "Category 1",
                  subCaetgories: [
                    SubCategory(categoryName: "Category 1 Sub 1"),
                    SubCategory(categoryName: "Category 1 Sub 2"),
                    SubCategory(categoryName: "Category 1 Sub 3")
                  ]
        ),
        Category(categoryId: 2,
                  categoryName: "Category 2",
                  subCaetgories: [
                    SubCategory(categoryName: "Category 2 Sub 1"),
                    SubCategory(categoryName: "Category 2 Sub 2"),
                    SubCategory(categoryName: "Category 2 Sub 3")
                  ]
        ),
        Category(categoryId: 3,
                  categoryName: "Category 3",
                  subCaetgories: [
                    SubCategory(categoryName: "Category 3 Sub 1"),
                    SubCategory(categoryName: "Category 3 Sub 2"),
                    SubCategory(categoryName: "Category 3 Sub 3")
                  ]
        ),
    ]
    #endif
    
    
    struct SubCategory: Hashable {
        var categoryName: String
    }
}
