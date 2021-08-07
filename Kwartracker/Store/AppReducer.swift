//
//  AppReducer.swift
//  Kwartracker
//
//  Created by Jacob on 3/29/21.
//

import Foundation
import Combine

enum AppReducer {
    static func appReducer(
        state: inout AppState,
        action: AppAction,
        environment: World
    ) -> AnyPublisher<AppAction, Never> {
        switch action {
        case let .transactionsView(action):
            return transactionsViewReducer(
                state: &state.transactionState,
                action: action,
                environment: environment
            )
            .map(AppAction.transactionsView)
            .eraseToAnyPublisher()
        case let .authView(action: action):
            return authReducer(
                state: &state.authState,
                action: action,
                environment: environment
            )
            .map(AppAction.authView)
            .eraseToAnyPublisher()
        case let .userProfileView(action):
            return userProfileReducer(
                state: &state.userProfileState,
                action: action,
                environment: environment
            )
            .map(AppAction.userProfileView)
            .eraseToAnyPublisher()
        case let .categoryView(action: action):
            return categoryViewReducer(
                state: &state.categoryState,
                action: action,
                environment: environment
            )
            .map(AppAction.categoryView)
            .eraseToAnyPublisher()
        }
    }
}
