//
//  ExampleMenuReducer.swift
//  Kwartracker
//
//  Created by Jacob on 3/30/21.
//

import Foundation
import Combine
import SwiftUI

enum ExampleMenuReducer {
    static func reducer(state: inout ExampleMenuState,
                        action: ExampleMenuAction,
                        environment: World)
    -> AnyPublisher<ExampleMenuAction, Never> {
        switch action {
        case .add(let item):
            state.menu.append(item)
        case .edit(let item):
            if let index = state.menu.enumerated().first(where: { $0.element.id == item.id })?.offset {
                state.menu[index] = item
            }
        case .delete(let index):
            if state.menu.count > index {
                state.menu.remove(at: index)
            }
        }
        return Empty().eraseToAnyPublisher()
    }
}
