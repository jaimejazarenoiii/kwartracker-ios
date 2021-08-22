//
//  WalletTest.swift
//  KwartrackerTests
//
//  Created by Leah Joy Ylaya on 8/9/21.
//

import XCTest
@testable import Kwartracker
import Combine

class WalletTest: XCTestCase {
    var mockWalletService: MockWalletServiceClient!
    var store: AppStore!
    
    override func setUp() {
        super.setUp()
        mockWalletService = MockWalletServiceClient()
        let world = World(walletService: mockWalletService!)
        store = AppStore(
            initialState: .init(),
            reducer: AppReducer.appReducer,
            environment: world
        )
    }

    override func tearDown() {
        store = nil
        mockWalletService = nil
        super.tearDown()
    }
    
    func testSuccesfulFetch() {
        store.send(.walletView(action: .fetch))
        let expect = expectation(description: "Success")
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
            expect.fulfill()
        }
        wait(for: [expect], timeout: 1)
        XCTAssertEqual(store.state.walletState.wallets.count, 3)
    }
    
    func testFailedFetch() {
        mockWalletService.shouldFetchWithError = true
        store.send(.walletView(action: .fetch))
        let expect = expectation(description: "Failed")
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
            expect.fulfill()
        }
        wait(for: [expect], timeout: 1)
        XCTAssert(!store.state.walletState.walletErrorMessage.isEmpty)
    }
    
    func testSuccessfulAdd() {
        let wallet = Wallet(id: 5, title: "My BDO", currency: .philippinePeso, targetAmount: 0)
        store.send(.walletView(action: .add(wallet: wallet)))
        let expect = expectation(description: "Success")
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
            expect.fulfill()
        }
        wait(for: [expect], timeout: 1)
        XCTAssertEqual(store.state.walletState.wallets.count, 1)
    }
    
    func testFailedAdd() {
        mockWalletService.shouldAddWithError = true
        let wallet = Wallet(id: 5, title: "My BDO", currency: .philippinePeso, targetAmount: 0)
        store.send(.walletView(action: .add(wallet: wallet)))
        let expect = expectation(description: "Success")
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
            expect.fulfill()
        }
        wait(for: [expect], timeout: 1)
        XCTAssert(!store.state.walletState.walletErrorMessage.isEmpty)
    }
    
    func testSuccessfulEdit() {
        let wallet = Wallet(id: 5, title: "My BDO", currency: .philippinePeso, targetAmount: 0)
        store.send(.walletView(action: .append(wallets: [wallet])))
        store.send(.walletView(action: .edit(wallet: wallet)))
        let expect = expectation(description: "Success")
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
            expect.fulfill()
        }
        wait(for: [expect], timeout: 1)
        XCTAssertEqual(store.state.walletState.wallets.first?.id, wallet.id)
    }
    
    func testFailedEdit() {
        mockWalletService.shouldEditWithError = true
        let wallet = Wallet(id: 5, title: "My BDO", currency: .philippinePeso, targetAmount: 0)
        store.send(.walletView(action: .append(wallets: [wallet])))
        store.send(.walletView(action: .edit(wallet: wallet)))
        let expect = expectation(description: "Success")
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
            expect.fulfill()
        }
        wait(for: [expect], timeout: 1)
        XCTAssert(!store.state.walletState.walletErrorMessage.isEmpty)
    }
}
