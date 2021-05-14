//
//  TransactionsViewState.swift
//  Kwartracker
//
//  Created by Jacob on 4/26/21.
//

import Foundation
import SwiftUI
import Combine

struct TransactionsViewState {
    var transactions: [Transaction] = sampleTransactions
    var transaction: Transaction? = nil
    var transactionErrorMessage: String = ""
}

func transactionsViewReducer(
    state: inout TransactionsViewState,
    action: TransactionsViewAction,
    environment: World
) -> AnyPublisher<TransactionsViewAction, Never> {
    switch action {
    case .add(let transaction):
        if let errorMessage = transaction.createTransactionErrorMessage(),
           !errorMessage.isEmpty {
            state.transactionErrorMessage = errorMessage
        } else {
            state.transactions.append(transaction)
        }
    case .edit(let transaction):
        if let index = state.transactions.enumerated().first(where: { $0.element.id == transaction.id })?.offset {
            state.transactions[index] = transaction
        } else {
            state.transactionErrorMessage = "Transaction item does not exist."
        }
    case .delete(let index):
        if index < state.transactions.count && index >= 0 {
            state.transactions.remove(at: index)
        } else {
            state.transactionErrorMessage = "Transaction item does not exist."
        }
    }
    return Empty().eraseToAnyPublisher()
}

extension TransactionsViewState {
    static let sampleTransactions: [Transaction] = [
        Transaction(
            id: 1,
            title: "March 15 Payroll",
            category: .init(title: "Salary"),
            amount: 10000,
            wallet: Wallet(id: 1),
            rawDateTime: "2021-03-05"
        ),
        Transaction(
            id: 2,
            title: "House Rental",
            category: .init(title: "BILLS"),
            amount: 5000,
            wallet: Wallet(id: 1),
            rawDateTime: "2021-03-05"
        ),
        Transaction(
            id: 3,
            title: "Sideline Payment",
            category: .init(title: "Salary"),
            amount: 10000,
            wallet: Wallet(id: 1),
            rawDateTime: "2021-03-05"
        ),
        Transaction(
            id: 4,
            title: "Sideline Payment",
            category: .init(title: "Salary"),
            amount: 100000,
            wallet: Wallet(id: 1),
            rawDateTime: "2021-03-05"
        )
    ]

    static let unitTestState = TransactionsViewState(transactions: TransactionsViewState.sampleTransactions)
}
