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
        store.send(.authView(action: .login(user: credentials, store: store)))
        
        XCTAssertNil(store.state.authState.errorMessage)
        
        guard let keychainToken = KeyChain.load(key: KeyChainKeys.userTokenKey) else {
            XCTAssert(false)
            return
        }
        
        let userToken = String(data: keychainToken, encoding: .utf8)
        
        XCTAssertNotNil(userToken)
    }
    
    func testFailedUserLogin() {
        mockAuthService.shouldLoginWithError = true
        
        let world = World(authenticationService: mockAuthService)
        let store = AppStore(initialState: .init(),
                                       reducer: AppReducer.appReducer,
                                       environment: world)
        
        let credentials = UserAuthInfo(email: "test@test.com", password: "admin123")
        store.send(.authView(action: .login(user: credentials, store: store)))
        
        XCTAssertNotNil(store.state.authState.errorMessage)
    }
    
    func testSuccessfulUserRegistration() {
        let world = World(authenticationService: mockAuthService)
        let store = AppStore(initialState: .init(),
                                       reducer: AppReducer.appReducer,
                                       environment: world)
        
        let credentials = UserAuthInfo(email: "test@test.com", password: "admin123")
        store.send(.authView(action: .create(user: credentials, store: store)))
        
        XCTAssertNil(store.state.authState.errorMessage)
        
        guard let keychainToken = KeyChain.load(key: KeyChainKeys.userTokenKey) else {
            XCTAssert(false)
            return
        }
        
        let userToken = String(data: keychainToken, encoding: .utf8)
        
        XCTAssertNotNil(userToken)
    }

    func testFailedUserRegistration() {
        mockAuthService.shouldSignupWithError = true
        
        let world = World(authenticationService: mockAuthService)
        let store = AppStore(initialState: .init(),
                                       reducer: AppReducer.appReducer,
                                       environment: world)
        
        let credentials = UserAuthInfo(email: "test@test.com", password: "admin123")
        store.send(.authView(action: .create(user: credentials, store: store)))
        
        XCTAssertNotNil(store.state.authState.errorMessage)
    }
    
    func testFailedLoginServiceRequest() {
        mockAuthService.shouldErrorRequest = true
        
        let world = World(authenticationService: mockAuthService)
        let store = AppStore(initialState: .init(),
                                       reducer: AppReducer.appReducer,
                                       environment: world)
        
        let credentials = UserAuthInfo(email: "test@test.com", password: "admin123")
        store.send(.authView(action: .create(user: credentials, store: store)))
        
        XCTAssertNotNil(store.state.authState.errorMessage)
    }
    
    func testFailedSignupServiceRequest() {
        mockAuthService.shouldErrorRequest = true
        
        let world = World(authenticationService: mockAuthService)
        let store = AppStore(initialState: .init(),
                                       reducer: AppReducer.appReducer,
                                       environment: world)
        
        let credentials = UserAuthInfo(email: "test@test.com", password: "admin123")
        store.send(.authView(action: .create(user: credentials, store: store)))
        
        XCTAssertNotNil(store.state.authState.errorMessage)
        
    }
}
