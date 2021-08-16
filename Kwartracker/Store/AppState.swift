//
//  AppState.swift
//  Kwartracker
//
//  Created by Jacob on 3/29/21.
//

import Foundation

struct AppState {
    var transactionState: TransactionsViewState
    var walletState: WalletViewState
    var authState: AuthenticationViewState
    var userProfileState: UserProfileViewState
    var categoryState: CategoryState

    init() {
        transactionState = TransactionsViewState()
        walletState = WalletViewState()
        authState = AuthenticationViewState()
        userProfileState = UserProfileViewState()
        categoryState = CategoryState()
    }
}
