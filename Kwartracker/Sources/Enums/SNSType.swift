//
//  SNSType.swift
//  Kwartracker
//
//  Created by Veverly Mae Ricaza Veverly on 4/20/21.
//

import Foundation
import UIKit
import SwiftUI

enum SNSType: String {
    case google
    case apple
    case signUp
    
    var color: Color {
        switch self {
        case .google:
            return Color.blue
        case .apple:
            return Color.black
        case .signUp:
            return Color(Asset.Colors.teal.color)
        }
    }
    
    var image: String {
        switch self {
        case .google:
            return "GoogleIcon"
        case.apple:
            return "AppleIcon"
        case .signUp:
            return ""
        }
    }
    
    var nameValue: String {
        switch self {
        case .google:
            return L10n.Sign.Up.With.google
        case.apple:
            return L10n.Sign.Up.With.apple
        case .signUp:
            return L10n.Sign.up
        }

    }
}
