//
//  AuthenticationTests.swift
//  KwartrackerTests
//
//  Created by John Ellie Go on 6/21/21.
//

import XCTest
@testable import Kwartracker

class AuthenticationViewStateTests: XCTestCase {
    var mockAuthService: MockAuthServiceClient!
    
    override func setUp() {
        super.setUp()
        mockAuthService = MockAuthServiceClient()
        _ = KeyChain.delete(key: KeyChainKeys.loginTokenKey)
    }

    override func tearDown() {
        mockAuthService = nil
        super.tearDown()
    }
    
    func testSuccesfulUserLogin() {
        let world = World(authenticationService: mockAuthService)
        let store = AppStore(initialState: .init(),
                                       reducer: AppReducer.appReducer,
                                       environment: world)
        
        let credentials = UserAuthInfo(email: "test@test.com", password: "admin123")
        store.send(.authView(action: .login(user: credentials)))
        
        let expect = expectation(description: "Sign in registered user")
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
            expect.fulfill()
        }
        wait(for: [expect], timeout: 1)
        
        XCTAssertNil(store.state.authState.errorMessage)
        
        guard let keychainToken = KeyChain.load(key: KeyChainKeys.loginTokenKey) else {
            XCTAssert(false)
            return
        }
        
        let userToken = String(data: keychainToken, encoding: .utf8)
        
        XCTAssertNotNil(userToken)
    }
    
    func testSuccessfulUserRegistration() {
        let world = World(authenticationService: mockAuthService)
        let store = AppStore(initialState: .init(),
                                       reducer: AppReducer.appReducer,
                                       environment: world)
        
        let credentials = UserAuthInfo(email: "test@test.com", password: "admin123")
        store.send(.authView(action: .create(user: credentials)))
        
        let expect = expectation(description: "Create new user account")
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
            expect.fulfill()
        }
        wait(for: [expect], timeout: 1)
        
        XCTAssertNil(store.state.authState.errorMessage)
        
        guard let keychainToken = KeyChain.load(key: KeyChainKeys.loginTokenKey) else {
            XCTAssert(false)
            return
        }
        
        let userToken = String(data: keychainToken, encoding: .utf8)
        
        XCTAssertNotNil(userToken)
    }

    func testFailedLoginServiceRequest() {
        mockAuthService.shouldErrorRequest = true
        
        let world = World(authenticationService: mockAuthService)
        let store = AppStore(initialState: .init(),
                                       reducer: AppReducer.appReducer,
                                       environment: world)
        
        let credentials = UserAuthInfo(email: "test@test.com", password: "admin123")
        store.send(.authView(action: .login(user: credentials)))
        
        let expect = expectation(description: "Error login request")
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
            expect.fulfill()
        }
        wait(for: [expect], timeout: 1)
        
        XCTAssertNotNil(store.state.authState.errorMessage)
    }
    
    func testFailedSignupServiceRequest() {
        mockAuthService.shouldErrorRequest = true
        
        let world = World(authenticationService: mockAuthService)
        let store = AppStore(initialState: .init(),
                                       reducer: AppReducer.appReducer,
                                       environment: world)
        
        let credentials = UserAuthInfo(email: "test@test.com", password: "admin123")
        store.send(.authView(action: .create(user: credentials)))
        
        let expect = expectation(description: "Error registration request")
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
            expect.fulfill()
        }
        wait(for: [expect], timeout: 1)
        
        XCTAssertNotNil(store.state.authState.errorMessage)
    }
}
