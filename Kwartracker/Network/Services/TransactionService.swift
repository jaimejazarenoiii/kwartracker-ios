//
//  TransactionService.swift
//  Kwartracker
//
//  Created by Jacob on 6/20/21.
//

import Foundation
import Combine

protocol TransactionServiceDelegate {
    func createNew(transaction: Transaction) -> AnyPublisher<Transaction, Error>
    func getDetail(transaction id: Int) -> AnyPublisher<Transaction, Error>
    func update(transaction: Transaction) -> AnyPublisher<Transaction, Error>
    func delete(transaction id: Int) -> AnyPublisher<Transaction, Error>
    func getTransactions() -> AnyPublisher<[Transaction], Error>
}

struct TransactionService: TransactionServiceDelegate {
    func getDetail(transaction id: Int) -> AnyPublisher<Transaction, Error> {
        Future<Transaction, Error> { _ in }
        .eraseToAnyPublisher()
    }

    func update(transaction: Transaction) -> AnyPublisher<Transaction, Error> {
        Future<Transaction, Error> { promise in
            promise(.success(transaction))
        }
        .eraseToAnyPublisher()
    }

    func delete(transaction id: Int) -> AnyPublisher<Transaction, Error> {
        Future<Transaction, Error> { _ in }
        .eraseToAnyPublisher()
    }

    func createNew(transaction: Transaction) -> AnyPublisher<Transaction, Error> {
        Future<Transaction, Error> { promise in
            promise(.success(transaction))
        }
        .eraseToAnyPublisher()
    }

    func getTransactions() -> AnyPublisher<[Transaction], Error> {
        Future<[Transaction], Error> { promise in
            promise(.success(TransactionsViewState.sampleTransactions))
        }
        .eraseToAnyPublisher()
    }
}
