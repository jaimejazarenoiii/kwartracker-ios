//
//  ExampleMenuState.swift
//  Kwartracker
//
//  Created by Jacob on 3/29/21.
//

import Foundation
import SwiftUI

struct ExampleMenuState {
    var menu: [MenuItem]
    var item: MenuItem

    static let example: ExampleMenuState
        = ExampleMenuState(menu: MenuItem.exampleMenu,
                           item: MenuItem())
}
