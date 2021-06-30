//
//  AuthenticationViewState.swift
//  Kwartracker
//
//  Created by John Ellie Go on 6/18/21.
//

import SwiftUI
import Combine
import Apollo

struct AuthenticationViewState {
    var errorMessage: String?
    var isAuthenticated: Bool {
        get {
            if errorMessage == nil {
                return KeyChain.load(key: KeyChainKeys.loginTokenKey) != nil
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
    case .create(let userInfo, let store):
        let profileInfo = ProfileInput(firstName: "", lastName: "", gender: 0, age: 18)
        let signupCredentials = SignUpWithEmailInput(
            email: userInfo.email,
            password: userInfo.password,
            passwordConfirmation: userInfo.password,
            profile: profileInfo
        )
        _ = environment.authenticationService.signUp(signUpCredential: signupCredentials) { result in
            switch result {
            case .success(let response):
                if let error = response.errors, let errorMessage = error.first?.localizedDescription {
                    store.send(.authView(action: .setErrorMessage(message: errorMessage)))
                }
                
                if let token = response.data?.signUpWithEmail?.token {
                    store.send(.authView(action: .setUserToken(token: token)))
                }
                break
            case .failure(let error):
                store.send(.authView(action: .setErrorMessage(message: error.localizedDescription)))
                debugPrint("[Authentication][logging in] error: \(error)")
                break
            }
        }
        break
    case .login(let userInfo, let store):
        let loginCredentials = CredentialsInput(email: userInfo.email, password: userInfo.password)
        _ = environment.authenticationService.signIn(credentialInput: loginCredentials) { result in
            switch result {
            case .success(let response):
                if let error = response.errors, let errorMessage = error.first?.localizedDescription {
                    store.send(.authView(action: .setErrorMessage(message: errorMessage)))
                }
                
                if let data = response.data?.signInWithEmail {
                    store.send(.authView(action: .setUserToken(token: data.token)))
                }
                break
            case .failure(let error):
                store.send(.authView(action: .setErrorMessage(message: error.localizedDescription)))
                debugPrint("[Authentication][logging in] error: \(error)")
                break
            }
        }
        break
    case .setUserToken(let token):
        let status = KeyChain.save(key: KeyChainKeys.loginTokenKey, value: token)
        state.errorMessage = nil
        print("status: ", status)
        break
    case .setErrorMessage(let message):
        state.errorMessage = message
        break
    }
    
    return Empty().eraseToAnyPublisher()
}
