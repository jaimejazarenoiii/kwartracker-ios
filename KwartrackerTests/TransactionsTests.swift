//
//  TransactionsTests.swift
//  KwartrackerTests
//
//  Created by Jacob on 5/6/21.
//

import XCTest
@testable import Kwartracker

class TransactionsTests: XCTestCase {
    var store: AppStore!

    override func setUp() {
        super.setUp()
        store = AppStore(
            initialState: .init(),
            reducer: AppReducer.appReducer,
            environment: World()
        )
    }

    override func tearDown() {
        store = nil
        super.tearDown()
    }

    /**
     Test for successful insertion of transaction to list.
     */
    func testSuccessfulAddTransaction() {
        // Inputs
        let newTransaction = Transaction.unitTestTransaction
        store.send(.transactionsView(action: .add(transaction: newTransaction)))

        // Assertions
        XCTAssert(store.state.transactionState.transactions.contains(where: { $0.id == newTransaction.id }))
    }

    /**
     Test for a failure add transaction without calling add process.
     */
    func testFailureAddTransactionWithoutCallingAddTransaction() {
        // Inputs
        let newTransaction = Transaction.unitTestTransaction

        // Assertions
        XCTAssertFalse(store.state.transactionState.transactions.contains(where: { $0.id == newTransaction.id }))
    }

    /**
     Test for successful create transaction request.
     */
    func testSuccessfulCreateTransactionRequest() {
        // Inputs
        let newTransaction = Transaction.unitTestTransaction
        store.send(.transactionsView(action: .createTransactionRequest(transaction: newTransaction)))

        // Add delay for api request
        let expect = expectation(description: "Create new transaction request")
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            expect.fulfill()
        }
        wait(for: [expect], timeout: 2)

        // Assertions
        XCTAssert(store.state.transactionState.transactions.contains(where: { $0.id == newTransaction.id }))
    }

    /**
     Test for successful fetch / load first page of transactions
     */
    func testSuccessfulLoadTransactions() {
        // Inputs, refresh transactions, get first page.
        store.send(.transactionsView(action: .refreshTransactions))

        // Add delay for api request
        let expect = expectation(description: "Create new transaction request")
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            expect.fulfill()
        }
        wait(for: [expect], timeout: 2)

        // Assertions
        let transactionState = store.state.transactionState
        XCTAssertFalse(transactionState.transactions.isEmpty)
        XCTAssert(transactionState.transactionErrorMessage.isEmpty)
    }

    /**
     Test for successful update of an existing transaction.
     */
    func testSuccessfulUpdateTransaction() {
        // Run for adding the transaction
        testSuccessfulAddTransaction()

        // Update transaction
        var transaction = Transaction.unitTestTransaction
        transaction.title = "Updated transaction"
        store.send(.transactionsView(action: .update(transaction: transaction)))

        // Assertions
        let successfullyUpdated = store.state.transactionState.transactions
            .contains(where: { $0.id == transaction.id &&
                $0.title == transaction.title
            })
        XCTAssert(successfullyUpdated)
    }
}
