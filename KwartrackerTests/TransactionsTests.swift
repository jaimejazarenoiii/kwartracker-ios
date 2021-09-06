//
//  TransactionsTests.swift
//  KwartrackerTests
//
//  Created by Jacob on 5/6/21.
//

import XCTest
@testable import Kwartracker

class TransactionsTests: XCTestCase {
    var state: TransactionsViewState!

    override func setUp() {
        super.setUp()
        state = TransactionsViewState(transactions: [])
    }

    override func tearDown() {
        state = nil
        super.tearDown()
    }

    /// Test for successful insertion of transaction to list.
    func testSuccessfulAddTransaction() {
        // Inputs
        let newTransaction = Transaction.unitTestTransaction

        // Process
        _ = transactionsViewReducer(state: &state, action: .add(transaction: newTransaction), environment: World())

        // Assert
        let newTransactionExist = state.transactions.contains(where: { $0.id == newTransaction.id })
        let emptyErrorMessage = state.transactionErrorMessage.isEmpty
        XCTAssert(newTransactionExist)
        XCTAssert(emptyErrorMessage)
    }

    /// Test for failed insertion of transaction to list.
    func testFailingAddTransaction() {
        // Inputs
        let newTransaction = Transaction.unitTestInvalidTransaction

        // Process
        _ = transactionsViewReducer(state: &state, action: .add(transaction: newTransaction), environment: World())

        // Assert
        let newTransactionExist = state.transactions.contains(where: { $0.id == newTransaction.id })
        let emptyErrorMessage = state.transactionErrorMessage.isEmpty
        XCTAssertFalse(newTransactionExist)
        XCTAssertFalse(emptyErrorMessage)
    }

    /// Test for successful edit / update of a transaction.
    func testSuccessfulEditTransaction() {
        // Inputs
        let newTransaction = Transaction.unitTestTransaction
        var editedTransaction = newTransaction
        editedTransaction.title = "Salary"
        editedTransaction.amount = 100

        // Process
        _ = transactionsViewReducer(state: &state, action: .add(transaction: newTransaction), environment: World())
        _ = transactionsViewReducer(state: &state, action: .edit(transaction: editedTransaction), environment: World())

        // Assert
        let isEditedTransactionUpdated = state.transactions
            .contains(where: {
                $0.id == editedTransaction.id &&
                    $0.title == editedTransaction.title &&
                    $0.amount == editedTransaction.amount
        })
        let emptyErrorMessage = state.transactionErrorMessage.isEmpty
        XCTAssert(isEditedTransactionUpdated)
        XCTAssert(emptyErrorMessage)
    }

    /// Test for failed edit / update of a transaction.
    func testFailingEditTransaction() {
        // Inputs
        let newTransaction = Transaction.unitTestTransaction
        var editedTransaction = newTransaction
        editedTransaction.id = 2
        editedTransaction.title = "Salary"
        editedTransaction.amount = 100

        // Process
        _ = transactionsViewReducer(state: &state, action: .add(transaction: newTransaction), environment: World())
        _ = transactionsViewReducer(state: &state, action: .edit(transaction: editedTransaction), environment: World())

        // Assert
        let isEditedTransactionUpdated = state.transactions
            .contains(where: {
                $0.id == editedTransaction.id &&
                    $0.title == editedTransaction.title &&
                    $0.amount == editedTransaction.amount
        })
        let emptyErrorMessage = state.transactionErrorMessage.isEmpty
        XCTAssertFalse(isEditedTransactionUpdated)
        XCTAssertFalse(emptyErrorMessage)
    }

    /// Test for successful removal of a transaction from the list.
    func testSuccessfulDeleteTransaction() {
        // Inputs
        let newTransaction = Transaction.unitTestTransaction

        // Process
        _ = transactionsViewReducer(state: &state, action: .add(transaction: newTransaction), environment: World())
        let index = state.transactions.firstIndex(where: { $0.id == newTransaction.id }) ?? -1
        _ = transactionsViewReducer(state: &state, action: .delete(index: index), environment: World())

        // Assert
        let isTransactionRemoved = !state.transactions.contains(where: { $0.id == newTransaction.id })
        let emptyErrorMessage = state.transactionErrorMessage.isEmpty
        XCTAssert(isTransactionRemoved)
        XCTAssert(emptyErrorMessage)
    }

    /// Test for successful removal of a transaction fromt the list.
    func testFailingDeleteTransaction() {
        // Inputs
        let newTransaction = Transaction.unitTestTransaction

        // Process
        _ = transactionsViewReducer(state: &state, action: .add(transaction: newTransaction), environment: World())
        let index = -1
        _ = transactionsViewReducer(state: &state, action: .delete(index: index), environment: World())

        // Assert
        let isTransactionRemoved = !state.transactions.contains(where: { $0.id == newTransaction.id })
        let emptyErrorMessage = state.transactionErrorMessage.isEmpty
        XCTAssertFalse(isTransactionRemoved)
        XCTAssertFalse(emptyErrorMessage)
    }
}
