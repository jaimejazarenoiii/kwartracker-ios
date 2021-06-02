//
//  Category.swift
//  Kwartracker
//
//  Created by Jacob on 4/26/21.
//

import Foundation

struct Category {
    var icon: Imageable? = nil
    var title: String
    var childCategories: [Category] = []
}
