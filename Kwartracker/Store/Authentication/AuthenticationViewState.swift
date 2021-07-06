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
    private var isRequesting: Bool = false
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
        if let token = token {
            let status = KeyChain.save(key: KeyChainKeys.loginTokenKey, value: token)
            state.errorMessage = nil
            UserDefaults.standard.set(true, forKey: "isLoggedIn")
            DDLogInfo("[Keychain][save] Status: \(status)")
        }
        break
    case .setErrorMessage(let message):
        state.errorMessage = message
        break
    }
    
    return Empty().eraseToAnyPublisher()
}
