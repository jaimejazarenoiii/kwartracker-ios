//
//  AppDelegate.swift
//  Kwartracker
//
//  Created by Jacob on 5/31/21.
//

import SwiftUI
import CocoaLumberjackSwift 

final class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        DDOSLogger.sharedInstance.configure()
        if CommandLine.arguments.contains("testing") {
            // clear your app state before running UI tests here.
            UIView.setAnimationsEnabled(false)
        }
        return true
    }
}

extension DDOSLogger {
    func configure() {
        DDLog.add(DDOSLogger.sharedInstance)
        let fileLogger: DDFileLogger = DDFileLogger()
        fileLogger.rollingFrequency = 60 * 60 * 24
        fileLogger.logFileManager.maximumNumberOfLogFiles = 7
        DDLog.add(fileLogger)
        DDLogInfo("DDOSLogger was just configured.")
    }
}
