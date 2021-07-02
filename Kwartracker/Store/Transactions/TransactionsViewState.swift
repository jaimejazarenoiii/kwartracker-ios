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
    var transactions: [Transaction] = []
    var transaction: Transaction? = nil
    var transactionErrorMessage: String = ""
    var shouldShowLoadmore: Bool = false
    var fetchRequestState: APIRequestState = .notStarted
    var createTransactionRequestState: APIRequestState = .notStarted
    var updateTransactionRequestState: APIRequestState = .notStarted
}

func transactionsViewReducer(
    state: inout TransactionsViewState,
    action: TransactionsViewAction,
    environment: World
) -> AnyPublisher<TransactionsViewAction, Never> {
    switch action {
    case .createTransactionRequest(let transaction):
        if !state.createTransactionRequestState.isRequesting {
            state.createTransactionRequestState = .requesting
            return environment.transactionService.createNew(transaction: transaction)
                .subscribe(on: DispatchQueue.main)
                .map { TransactionsViewAction.add(transaction: $0) }
                .catch { Just(TransactionsViewAction.setErrorMessage(message: $0.localizedDescription)) }
                .eraseToAnyPublisher()
        } else {
            // TBD: What to do when there is an ongoing request for creating new transaction?
        }
        break

    case .add(let transaction):
        state.createTransactionRequestState = .success
        state.transactions.append(transaction)
        break

    case .updateTransactionRequest(let transaction):
        if !state.updateTransactionRequestState.isRequesting {
            return environment.transactionService.update(transaction: transaction)
                .subscribe(on: DispatchQueue.main)
                .map { TransactionsViewAction.update(transaction: $0) }
                .catch { Just(TransactionsViewAction.setErrorMessage(message: $0.localizedDescription)) }
                .eraseToAnyPublisher()
        }
        break

    case .update(let transaction):
        if let index = state.transactions.enumerated().first(where: { $0.element.id == transaction.id })?.offset {
            state.transactions[index] = transaction
        }
        break

    case .deleteTransactionRequest: break

    case .delete(let index):
        if index < state.transactions.count && index >= 0 {
            state.transactions.remove(at: index)
        } else {
            state.transactionErrorMessage = "Transaction item does not exist."
        }
        break

    case .refreshTransactions:
        return environment.transactionService.getTransactions()
            .subscribe(on: DispatchQueue.main)
            .map { TransactionsViewAction.setTransactionList(transactions: $0) }
            .catch { Just(TransactionsViewAction.setErrorMessage(message: $0.localizedDescription)) }
            .eraseToAnyPublisher()

    case .loadMoreTransactions: break
        
    case .setLoadmoreShown(let show):
        state.shouldShowLoadmore = show
        break

    case .setTransactionList(let transactions):
        state.transactions += transactions
        break

    case .setErrorMessage(let message):
        state.transactionErrorMessage = message
        break
    default: break
    }
    return Empty().eraseToAnyPublisher()
}

extension TransactionsViewState {
    static let sampleTransactions: [Transaction] = [
        Transaction(
            id: 1,
            title: "March 15 Payroll",
            category: .init(id: 1, title: "Salary"),
            amount: 10000,
            wallet: Wallet(id: 1),
            rawDateTime: "2021-03-05"
        ),
        Transaction(
            id: 2,
            title: "House Rental",
            category: .init(id: 2, title: "BILLS"),
            amount: 5000,
            wallet: Wallet(id: 1),
            rawDateTime: "2021-03-05"
        ),
        Transaction(
            id: 3,
            title: "Sideline Payment",
            category: .init(id: 3, title: "Salary"),
            amount: 10000,
            wallet: Wallet(id: 1),
            rawDateTime: "2021-03-05"
        ),
        Transaction(
            id: 4,
            title: "Sideline Payment",
            category: .init(id: 4, title: "Salary"),
            amount: 100000,
            wallet: Wallet(id: 1),
            rawDateTime: "2021-03-05"
        )
    ]

    static let unitTestState = TransactionsViewState(transactions: TransactionsViewState.sampleTransactions)
}
