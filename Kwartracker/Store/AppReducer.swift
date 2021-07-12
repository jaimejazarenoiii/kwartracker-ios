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
        case .walletView(action: let action):
            return walletReducer(
                state: &state.walletState,
                action: action,
                environment: environment
            )
            .map(AppAction.walletView)
            .eraseToAnyPublisher()
        }
    }
}
