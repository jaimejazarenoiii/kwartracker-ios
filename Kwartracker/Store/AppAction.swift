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
    case walletView(action: WalletViewActions)
    case userProfileView(action: UserProfileViewAction)
    case category(action: CategoryAction)
    case changePassword(action: ChangePasswordAction)
    case editProfile(action: EditProfileAction)
}
