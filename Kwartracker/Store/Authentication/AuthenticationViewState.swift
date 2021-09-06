//
//  AuthenticationViewState.swift
//  Kwartracker
//
//  Created by John Ellie Go on 6/18/21.
//

import SwiftUI
import Combine
import Apollo
import CocoaLumberjackSwift

struct AuthenticationViewState {
    var isRequesting: Bool = false
    var errorMessage: String?
    var isAuthenticated: Bool {
        get {
            if errorMessage == nil {
                return KeyChainKeys.isLoggedIn()
            }
            return false
        }
    }
}

func authReducer(
    state: inout AuthenticationViewState,
    action: AuthenticationViewAction,
    environment: World
) -> AnyPublisher<AuthenticationViewAction, Never> {
    switch action {
    case .login(let userInfo):
        if let errorMessage = userInfo.validationErrorMessage {
            state.errorMessage = errorMessage
            break
        }
        guard !state.isRequesting else { break }
        state.isRequesting = true
        
        let loginCredentials = CredentialsInput(email: userInfo.email, password: userInfo.password)
        
        return environment.authenticationService.signIn(credentialInput: loginCredentials)
            .map {
                AuthenticationViewAction.setUserToken(token: $0.signInWithEmail?.token)
            }
            .catch {
                Just(AuthenticationViewAction.setErrorMessage(message: $0.localizedDescription))
            }
            .eraseToAnyPublisher()
    case .create(let userInfo):
        if let errorMessage = userInfo.validationErrorMessage {
            state.errorMessage = errorMessage
            break
        }
        guard !state.isRequesting else { break }
        state.isRequesting = true
        
        let profileInfo = ProfileInput(firstName: "", lastName: "", gender: 0, age: 18)
        let signupCredentials = SignUpWithEmailInput(
            email: userInfo.email,
            password: userInfo.password,
            passwordConfirmation: userInfo.password,
            profile: profileInfo
        )
        
        return environment.authenticationService.signUp(signUpCredential: signupCredentials)
            .map {
                AuthenticationViewAction.setUserToken(token: $0.signUpWithEmail?.token)
            }
            .catch { Just(AuthenticationViewAction.setErrorMessage(message: $0.localizedDescription)) }
            .assertNoFailure()
            .eraseToAnyPublisher()
    case .setUserToken(let token):
        state.isRequesting = false
        
        if let token = token {
            let status = KeyChain.save(key: KeyChainKeys.loginTokenKey, value: token)
            state.errorMessage = nil
            UserDefaults.standard.set(true, forKey: "isLoggedIn")
            DDLogInfo("[Keychain][save] Status: \(status)")
        }
        break
    case .setErrorMessage(let message):
        state.isRequesting = false
        state.errorMessage = message
        break
    case .logout:
        UserDefaults.standard.setValue(false, forKey: "isLoggedIn")
        break
    case .setAccessPage(let page):
        UserDefaults.standard.setValue(page.rawValue, forKey: "accessPage")
        break
    }
    
    return Empty().eraseToAnyPublisher()
}
