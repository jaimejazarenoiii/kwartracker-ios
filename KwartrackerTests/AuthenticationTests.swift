//
//  AuthenticationTests.swift
//  KwartrackerTests
//
//  Created by John Ellie Go on 6/21/21.
//

import XCTest
@testable import Kwartracker

class AuthenticationTests: XCTestCase {
    var state: AuthenticationViewState!
    var mockAuthService: MockAuthServiceClient!
    
    override func setUp() {
        super.setUp()
        state = AuthenticationViewState()
        mockAuthService = MockAuthServiceClient()
    }

    override func tearDown() {
        state = nil
        mockAuthService = nil
        super.tearDown()
    }
    
    func testSuccesfulUserLogin() {
        let credentials = CredentialsInput(email: "test@test.com", password: "admin123")
        
        mockAuthService.signIn(credentialInput: credentials) { result in
            switch result {
            case .success(let response):
                XCTAssertNotNil(response)
                XCTAssertNil(response.errors)
                
                guard let token = response.data?.signInWithEmail?.token else {
                    XCTAssert(false)
                    return
                }
                
                _ = authReducer(state: &self.state, action: .setUserToken(token: token), environment: World())
                
                XCTAssert(self.state.isAuthenticated)
                XCTAssert(!self.state.userToken.isEmpty)
                
                guard let userToken = KeyChain.load(key: L10n.Auth.Key.userToken) else {
                    XCTAssert(false)
                    return
                }
                
                let result = userToken.to(type: String.self)
                XCTAssert(!result.isEmpty)
                
                break
            case .failure(let error):
                XCTAssertNil(error)
                break
            }
        }
    }
    
    func testFailedUserLogin() {
        mockAuthService.shouldLoginWithError = true
        
        let credentials = CredentialsInput(email: "test@test.com", password: "admin123")
        
        _ = mockAuthService.signIn(credentialInput: credentials) { result in
            switch result {
            case .success(let response):
                XCTAssertNotNil(response)
                XCTAssertNil(response.data?.signInWithEmail)
                XCTAssertNotNil(response.errors)
                
                guard let errorMessage = response.errors?.first?.errorDescription else {
                    XCTAssert(false)
                    return
                }
                
                _ = authReducer(state: &self.state,
                                action: .setErrorMessage(message: errorMessage),
                                environment: World())
                
                XCTAssertNotNil(errorMessage)
                
                break
            case .failure(let error):
                XCTAssertNil(error)
                break
            }
        }
    }
    
    func testSuccessfulUserRegistration() {
        let profileInfo = ProfileInput(firstName: "", lastName: "", gender: 0, age: 18)
        let signupCredentials = SignUpWithEmailInput(
            email: "test@test.com",
            password: "admin123",
            passwordConfirmation: "admin123",
            profile: profileInfo
        )
        
        _ = mockAuthService.signUp(signUpCredential: signupCredentials) { result in
            switch result {
            case .success(let response):
                XCTAssertNotNil(response)
                XCTAssertNil(response.errors)
                
                guard let token = response.data?.signUpWithEmail?.token else {
                    XCTAssert(false)
                    return
                }
                
                _ = authReducer(state: &self.state, action: .setUserToken(token: token), environment: World())
                
                XCTAssert(self.state.isAuthenticated)
                XCTAssert(!self.state.userToken.isEmpty)
                
                guard let userToken = KeyChain.load(key: L10n.Auth.Key.userToken) else {
                    XCTAssert(false)
                    return
                }
                
                let result = userToken.to(type: String.self)
                XCTAssert(!result.isEmpty)
                
                break
            case .failure(let error):
                XCTAssertNil(error)
                break
            }
        }
    }

    func testFailedUserRegistration() {
        mockAuthService.shouldSignupWithError = true
        
        let profileInfo = ProfileInput(firstName: "", lastName: "", gender: 0, age: 18)
        let signupCredentials = SignUpWithEmailInput(
            email: "test@test.com",
            password: "admin123",
            passwordConfirmation: "admin123",
            profile: profileInfo
        )
            
        _ = mockAuthService.signUp(signUpCredential: signupCredentials) { result in
            switch result {
            case .success(let response):
                XCTAssertNotNil(response)
                XCTAssertNil(response.data?.signUpWithEmail)
                XCTAssertNotNil(response.errors)
                
                guard let errorMessage = response.errors?.first?.errorDescription else {
                    XCTAssert(false)
                    return
                }
                
                _ = authReducer(state: &self.state,
                                action: .setErrorMessage(message: errorMessage),
                                environment: World())
                
                XCTAssertNotNil(errorMessage)
                
                break
            case .failure(let error):
                XCTAssertNil(error)
                break
            }
        }
    }
    
    func testFailedLoginServiceRequest() {
        mockAuthService.shouldErrorRequest = true
        
        let credentials = CredentialsInput(email: "test@test.com", password: "admin123")
        
        _ = mockAuthService.signIn(credentialInput: credentials) { result in
            switch result {
            case .success(let response):
                XCTAssertNil(response)
                break
            case .failure(let error):
                XCTAssertNotNil(error)
                break
            }
        }
        
    }
    
    func testFailedSignupServiceRequest() {
        mockAuthService.shouldErrorRequest = true
        
        let profileInfo = ProfileInput(firstName: "", lastName: "", gender: 0, age: 18)
        let signupCredentials = SignUpWithEmailInput(
            email: "test@test.com",
            password: "admin123",
            passwordConfirmation: "admin123",
            profile: profileInfo
        )
        
        _ = mockAuthService.signUp(signUpCredential: signupCredentials) { result in
            switch result {
            case .success(let response):
                XCTAssertNil(response)
                break
            case .failure(let error):
                XCTAssertNotNil(error)
                break
            }
        }
    }
}
