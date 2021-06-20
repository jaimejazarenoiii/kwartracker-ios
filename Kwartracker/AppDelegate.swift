//
//  AppDelegate.swift
//  Kwartracker
//
//  Created by Jacob on 5/31/21.
//

import SwiftUI

final class AppDelegate: NSObject, UIApplicationDelegate {
    func applicationDidFinishLaunching(_ application: UIApplication) {
        if CommandLine.arguments.contains("testing") {
            // clear your app state before running UI tests here.
            UIView.setAnimationsEnabled(false)
        }
    }
}
