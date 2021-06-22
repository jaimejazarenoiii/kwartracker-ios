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
    var userToken = ""
    var errorMessage: String?
    var isAuthenticated: Bool {
        !userToken.isEmpty
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
        environment.authenticationService.signUp(signUpCredential: signupCredentials) { result in
            switch result {
            case .success(let response):
                if let token = response.data?.signUpWithEmail?.token {
                    store.send(.authView(action: .setUserToken(token: token)))
                }
                break
            case .failure(let error):
                debugPrint("[Authentication][logging in] error: \(error)")
                break
            }
        }
        break
    case .login(let userInfo, let store):
        let loginCredentials = CredentialsInput(email: userInfo.email, password: userInfo.password)
        environment.authenticationService.signIn(credentialInput: loginCredentials) { result in
            switch result {
            case .success(let response):
                guard let data = response.data?.signInWithEmail else { return }
                store.send(.authView(action: .setUserToken(token: data.token)))
                break
            case .failure(let error):
                debugPrint("[Authentication][logging in] error: \(error)")
                break
            }
        }
        break
    case .setUserToken(let token):
        state.userToken = token
        
        let data = Data(from: token)
        let status = KeyChain.save(key: KeyChainKeys.userTokenKey, data: data)
        
        print("status: ", status)
        break
    case .setErrorMessage(let message):
        state.errorMessage = message
    }
    
    return Empty().eraseToAnyPublisher()
}
