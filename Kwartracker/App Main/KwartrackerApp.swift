//
//  KwartrackerApp.swift
//  Kwartracker
//
//  Created by Jacob on 3/25/21.
//

import SwiftUI

@main
struct KwartrackerApp: App {
    let store: AppStore = AppStore(initialState: .init(),
                                   reducer: AppReducer.appReducer,
                                   environment: World())

    var body: some Scene {
        WindowGroup {
            TransactionsView()
        }
    }
}
