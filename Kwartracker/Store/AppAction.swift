//
//  AppAction.swift
//  Kwartracker
//
//  Created by Jacob on 3/29/21.
//

import Foundation

enum AppAction {
    case transactionsView(action: TransactionsViewAction)
    case authView(action: AuthenticationViewAction)
    case userProfileView(action: UserProfileViewAction)
    case categoryView(action: CategoryViewAction)
    case category(action: CategoryAction)
}
