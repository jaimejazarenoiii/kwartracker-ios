//
//  WalletViewActions.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 5/14/21.
//

import Foundation

enum WalletViewActions {
    case add(transaction: Wallet)
    case edit(transaction: Wallet)
    case delete(id: Int)
}
