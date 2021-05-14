//
//  WalletViewState.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 5/14/21.
//

import SwiftUI
import Combine

struct WalletViewState {
    var wallets: [Wallet] = sampleWallets
    var wallet: Wallet? = nil
    var walletErrorMessage: String = ""
    
    func walletReducer(
        state: inout WalletViewState,
        action: WalletViewActions,
        environment: World
    ) -> AnyPublisher<WalletViewActions, Never> {
        switch action {
        case .add(let wallet):
            if let errorMessage = wallet.createTransactionErrorMessage(),
               !errorMessage.isEmpty {
                state.walletErrorMessage = errorMessage
            } else {
                state.wallets.append(wallet)
            }
        case .edit(let wallet):
            if let index = state.wallets.enumerated().first(where: { $0.element.id == wallet.id })?.offset {
                state.wallets[index] = wallet
            } else {
                state.walletErrorMessage = "Wallet does not exist."
            }
        case .delete(let index):
            if index < state.wallets.count && index >= 0 {
                state.wallets.remove(at: index)
            } else {
                state.walletErrorMessage = "Wallet does not exist."
            }
        }
        return Empty().eraseToAnyPublisher()
    }
}

    extension WalletViewState {
        static let sampleWallets: [Wallet] = [
            Wallet(id: 1,
                   title: "Security Bank",
                   type: WalletType.savings.rawValue,
                   currency: .philippinePeso,
                   total: 1_000_000,
                   targetRawDate: ""),
            Wallet(id: 2,
                   title: "France Trip",
                   type: WalletType.goal.rawValue,
                   currency: .philippinePeso,
                   total: 1_000_000,
                   targetRawDate: "2025-06-30"),
            Wallet(id: 3,
                   title: "Samgyupsal",
                   type: WalletType.budget.rawValue,
                   currency: .philippinePeso,
                   total: 10_000,
                   targetRawDate: ""),
            Wallet(id: 4,
                   title: "Ramen",
                   type: WalletType.budget.rawValue,
                   currency: .philippinePeso,
                   total: 5_000,
                   targetRawDate: "")
        ]

        static let unitTestState = TransactionsViewState(transactions: TransactionsViewState.sampleTransactions)
    }
