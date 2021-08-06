//
//  KwartrackerApp.swift
//  Kwartracker
//
//  Created by Jacob on 3/25/21.
//

import SwiftUI

@main
struct KwartrackerApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false

    let store: AppStore = AppStore(
        initialState: .init(),
        reducer: AppReducer.appReducer,
        environment: World()
    )

    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                MyProfileView()
                    .environmentObject(store)
            } else {
                SignInView()
                    .environmentObject(store)
            }
        }
    }
}
