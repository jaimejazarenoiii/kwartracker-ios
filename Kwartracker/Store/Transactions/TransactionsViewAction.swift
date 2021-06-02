//
//  TransactionsViewAction.swift
//  Kwartracker
//
//  Created by Jacob on 4/26/21.
//

import Foundation

enum TransactionsViewAction {
    case add(transaction: Transaction)
    case edit(transaction: Transaction)
    case delete(index: Int)
    case loadMoreTransactions(page: Int)
    case refreshTransactions
    case setLoadmoreShown(show: Bool)
}
