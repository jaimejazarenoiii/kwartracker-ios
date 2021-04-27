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
    
    var image: UIImage {
        switch self {
        case .google:
            return Asset.Images.googleIcon.image
        case.apple:
            return Asset.Images.appleIcon.image
        case .signUp:
            return UIImage()
        }
    }
    
    var nameValue: String {
        switch self {
        case .google:
            return L10n.ButtonLabelSign.Up.With.google
        case.apple:
            return L10n.ButtonLabelSign.Up.With.apple
        case .signUp:
            return L10n.ButtonLabelSign.up
        }

    }
}
