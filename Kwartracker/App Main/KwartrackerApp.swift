//
//  KwartrackerApp.swift
//  Kwartracker
//
//  Created by Jacob on 3/25/21.
//

import SwiftUI

/**
 Kwartracker app using swift ui
 @main
 */
struct KwartrackerAppSwiftUI: App {
    let store: AppStore = AppStore(
        initialState: .init(),
        reducer: AppReducer.appReducer,
        environment: World()
    )
    var body: some Scene {
        WindowGroup {
            if KeyChainKeys.isLoggedIn() {
                // For the meantime, show text view
                Text("You are logged in.")
            } else {
                SignInView()
            }
        }
    }
}

struct RootView: View {
    var body: some View {
        SignInView()
    }
}

struct KwartrackerApp: App {
    let store: AppStore = AppStore(
        initialState: .init(),
        reducer: AppReducer.appReducer,
        environment: World()
    )
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
