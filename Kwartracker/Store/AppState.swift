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
    init() {
        transactionState = TransactionsViewState()
        walletState = WalletViewState()
    }
}
