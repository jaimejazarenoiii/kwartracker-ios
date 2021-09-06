//
//  UIView+Extensions.swift
//  Kwartracker
//
//  Created by Veverly Mae Ricaza on 5/26/21.
//

import Foundation
import UIKit
import SwiftUI

public struct ListSeparatorStyleNoneModifier: ViewModifier {
    public func body(content: Content) -> some View {
        content.onAppear {
            UITableView.appearance().separatorStyle = .none
        }.onDisappear {
            UITableView.appearance().separatorStyle = .singleLine
        }
    }
}

extension View {
    public func listSeparatorStyleNone() -> some View {
        modifier(ListSeparatorStyleNoneModifier())
    }

    // Check if running on preview mode or running on a device
    // https://stackoverflow.com/a/61741858
    var safeAreaInsets: UIEdgeInsets {
        // Set preview environment key
        let previewEnvironmentKey = "XCODE_RUNNING_FOR_PREVIEWS"

        // Check if device is runnning on preview mode
        if ProcessInfo.processInfo.environment[previewEnvironmentKey] == "1" {
            // Set default safe insets to iPhone 11
            return UIEdgeInsets(top: 48, left: 0, bottom: 34, right: 0)

        } else {
            // Use running device safe area insets
            let window = UIApplication.shared.windows[0]

            return window.safeAreaInsets
        }
    }
}
