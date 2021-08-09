//
//  WalletViewActions.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 5/14/21.
//

import Foundation
import Apollo

enum WalletViewActions {
    case fetch
    case add(wallet: Wallet)
    case edit(wallet: Wallet)
    case delete(wallet: Wallet)
    case append(wallets: [Wallet])
    case update(wallet: Wallet)
    case error(error: GraphQLError)
}
