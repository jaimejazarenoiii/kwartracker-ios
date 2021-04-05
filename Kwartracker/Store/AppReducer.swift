//
//  AppReducer.swift
//  Kwartracker
//
//  Created by Jacob on 3/29/21.
//

import Foundation
import Combine

enum AppReducer {
    static func appReducer(state: inout AppState,
                           action: AppAction,
                           environment: World) -> AnyPublisher<AppAction, Never> {
        switch action {
        case let .exampleMenu(action):
            return ExampleMenuReducer
                .reducer(
                    state: &state.exampleMenu,
                    action: action,
                    environment: environment
                )
                .map(AppAction.exampleMenu)
                .eraseToAnyPublisher()
        }
    }
}