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

    @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                // For the meantime, show text view
                Text("You are logged in.")
            } else {
                CategoryView().environmentObject(store)
            }
        }
    }
}
