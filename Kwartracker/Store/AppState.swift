//
//  AppState.swift
//  Kwartracker
//
//  Created by Jacob on 3/29/21.
//

import Foundation

struct AppState {
    var exampleMenu: ExampleMenuState

    init() {
        exampleMenu = ExampleMenuState(
            menu: MenuItem.exampleMenu,
            item: MenuItem(id: .init(), name: "", price: 0)
        )
    }
}
