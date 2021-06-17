//
//  WalletTypes.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 5/14/21.
//

import Foundation

enum WalletType: Int {
    case none = 0
    case budget = 1
    case goal = 2
    case savings = 3
    
    var stringValue: String {
        switch self {
        case .budget:
            return L10n.WalletType.budget
        case .goal:
            return L10n.WalletType.goal
        case .savings:
            return L10n.WalletType.savings
        case .none:
            return ""
        }
    }
}

