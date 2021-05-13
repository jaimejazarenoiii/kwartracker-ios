//
//  WalletPageUITests.swift
//  KwartrackerUITests
//
//  Created by Leah Joy Ylaya on 5/13/21.
//

import XCTest

class WalletPageUITests: XCTestCase {
    
    let app = XCUIApplication()
    override func setUp() {
        continueAfterFailure = false
        setupSnapshot(app)
        app.launch()
    }

    override func tearDown() {
        super.tearDown()
        app.terminate()
    }
    
    func testAccessMainWalletPage() {
        let latestMovie = app.staticTexts["My Wallets"]
        XCTAssertTrue(latestMovie.exists)
        snapshot("Wallet-Page", timeWaitingForIdle: 2)
    }
}
