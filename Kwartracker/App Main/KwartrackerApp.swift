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
    @AppStorage("accessPage") private var accessPage: Int = AccessPage.login.rawValue

    let store: AppStore = AppStore(
        initialState: .init(),
        reducer: AppReducer.appReducer,
        environment: World()
    )

    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                NavigationView {
                    HomeView().navigationBarHidden(true)
                }
                .environmentObject(store)
            } else {
                if AccessPage(rawValue: accessPage) == .login {
                    SignInView().environmentObject(store)
                } else {
                    SignUpView().environmentObject(store)
                }
            }
        }
    }
}
