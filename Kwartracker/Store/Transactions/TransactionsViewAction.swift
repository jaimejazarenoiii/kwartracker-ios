//
//  TransactionsViewAction.swift
//  Kwartracker
//
//  Created by Jacob on 4/26/21.
//

import Foundation

enum TransactionsViewAction {
    case createTransactionRequest(transaction: Transaction)
    case add(transaction: Transaction)
    case updateTransactionRequest(transaction: Transaction)
    case update(transaction: Transaction)
    case deleteTransactionRequest(transactionId: Int)
    case delete(index: Int)
    case loadMoreTransactions(page: Int)
    case refreshTransactions
    case setLoadmoreShown(show: Bool)
    case setTransactionList(transactions: [Transaction])
    case setErrorMessage(message: String)
}
