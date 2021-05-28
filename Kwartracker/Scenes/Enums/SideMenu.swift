//
//  SideMenu.swift
//  Kwartracker
//
//  Created by Veverly Mae Ricaza on 5/24/21.
//

import Foundation
import UIKit

enum SideMenu: CaseIterable, Identifiable {
    
    static var sideMenuList: [SideMenu] {
        return [.home, transaction, .wallets, .reports, .myProfile, .settings]
    }
    
    case home
    case transaction
    case wallets
    case reports
    case myProfile
    case settings
    
    var id: String { UUID().uuidString }
    
    var text: String {
        switch self {
        case .home:
            return L10n.SideMenu.Label.home
        case .transaction:
            return L10n.SideMenu.Label.transaction
        case .wallets:
            return L10n.SideMenu.Label.wallets
        case .reports:
            return L10n.SideMenu.Label.reports
        case .myProfile:
            return L10n.SideMenu.Label.myProfile
        case .settings:
            return L10n.SideMenu.Label.settings
        }
    }
    
    var image: UIImage {
        switch self {
        case .home:
            return Asset.Images.homeIcon.image
        case .transaction:
            return Asset.Images.transactionIcon.image
        case .wallets:
            return Asset.Images.walletIcon.image
        case .reports:
            return Asset.Images.reportIcon.image
        case .myProfile:
            return Asset.Images.profileIcon.image
        case .settings:
            return Asset.Images.settingsIcon.image
        }
    }
}
