//
//  AddWalletUITest.swift
//  KwartrackerUITests
//
//  Created by Leah Joy Ylaya on 5/18/21.
//

import XCTest

class AddWalletUITest: XCTestCase {
    
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
        let addIcon = app.buttons["addNewWallet"]
        XCTAssertTrue(addIcon.isHittable)
        addIcon.tap()
        sleep(1)
        let addWallet = app.staticTexts["Add Wallet"]
        XCTAssertTrue(addWallet.exists)
        snapshot("Add-Wallet", timeWaitingForIdle: 2)
    }
    
    func testTextfield() {
        let addIcon = app.buttons["addNewWallet"]
        XCTAssertTrue(addIcon.isHittable)
        addIcon.tap()
        sleep(1)
        let textField = app.textFields["walletName"]
        textField.tap()
        textField.typeText("Savings")
        XCTAssertTrue(textField.exists)
        snapshot("Add-Wallet", timeWaitingForIdle: 2)
    }
}
