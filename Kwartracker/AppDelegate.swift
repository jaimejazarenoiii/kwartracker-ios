//
//  AppDelegate.swift
//  Kwartracker
//
//  Created by Jacob on 5/31/21.
//

import SwiftUI
import CocoaLumberjackSwift
import RealmSwift

final class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        configDDOSLoger()
        configRealm()
        if CommandLine.arguments.contains("testing") {
            // clear your app state before running UI tests here.
            UIView.setAnimationsEnabled(false)
        }
        return true
    }

    private func configRealm() {
        let config = Realm.Configuration(readOnly: false, deleteRealmIfMigrationNeeded: true)
        Realm.Configuration.defaultConfiguration = config
        DDLogInfo("Configure realm.")
    }

    private func configDDOSLoger() {
        DDLog.add(DDOSLogger.sharedInstance)
        let fileLogger: DDFileLogger = DDFileLogger()
        fileLogger.rollingFrequency = 60 * 60 * 24
        fileLogger.logFileManager.maximumNumberOfLogFiles = 7
        DDLog.add(fileLogger)
        DDLogInfo("DDOSLogger was just configured.")
    }
}
