//
//  ChangePasswordTests.swift
//  KwartrackerTests
//
//  Created by Jacob on 9/1/21.
//

import XCTest
@testable import Kwartracker

class ChangePasswordTests: XCTestCase {
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

    func testEmptyInputPasswordShouldHaveError() {
        // Inputs
        let inputPassword = ""
        let inputConfirmPassword = "mypassword123"
        store.send(.changePassword(action: .submit(password: inputPassword, confirmPassword: inputConfirmPassword)))

        // Assertions
        XCTAssertNotNil(store.state.changePasswordState.errorMessage)
    }

    func testEmptyConfirmPasswordShouldHaveError() {
        // Inputs
        let inputPassword = "mypassword123"
        let inputConfirmPassword = ""
        store.send(.changePassword(action: .submit(password: inputPassword, confirmPassword: inputConfirmPassword)))

        // Assertions
        XCTAssertNotNil(store.state.changePasswordState.errorMessage)
    }

    func testPasswordAndConfirmPasswordDoesNotMatchShouldHaveError() {
        // Inputs
        let inputPassword = "mypassword123"
        let inputConfirmPassword = "321drowssapym"
        store.send(.changePassword(action: .submit(password: inputPassword, confirmPassword: inputConfirmPassword)))

        // Assertions
        XCTAssertNotNil(store.state.changePasswordState.errorMessage)
    }

    func testChangePasswordValidForSubmission() {
        // Inputs
        let inputPassword = "mypassword123"
        let inputConfirmPassword = "mypassword123"
        store.send(.changePassword(action: .submit(password: inputPassword, confirmPassword: inputConfirmPassword)))

        // Assertions
        XCTAssertNil(store.state.changePasswordState.errorMessage)
    }
}

