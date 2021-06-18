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
    var isRequesting = false
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
    case .create(let userInfo):
        let profileInfo = ProfileInput(firstName: "", lastName: "", gender: 0, age: 18)
        let signupCredentials = SignUpWithEmailInput(email: userInfo.email, password: userInfo.password,
                                                     passwordConfirmation: userInfo.password, profile: profileInfo)
        let mutation = SignUpMutation(signUpEmailInput: signupCredentials)
        
        Network.shared.apollo.perform(mutation: mutation) { result in
            switch result {
            case .success(let graphQLResult):
                if let token = graphQLResult.data?.signUpWithEmail?.token {
                    
                }
            case .failure(let error):
                // state.errorMessage = error.localizedDescription
                break
            }
        }
        break
    case .login(let userInfo):
        let loginCredentials = CredentialsInput(email: userInfo.email, password: userInfo.password)
        let mutation = SignInMutation(signInCredential: loginCredentials)
        
        Network.shared.apollo.perform(mutation: mutation) { result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data?.signInWithEmail {
                    // state.userToken = data.token
                }
                break
            case .failure(let error):
                // state.errorMessage = error.localizedDescription
                break
            }
        }
        break
    }
    
    return Empty().eraseToAnyPublisher()
}

fileprivate enum SignUpResponse {
    case registrationSuccess(token: String, state: AuthenticationViewState)
    case error(message: String)
}

fileprivate enum SignInResponse {
    case signInSuccess(userInfo: SignInMutation.Data.SignInWithEmail)
    case error(message: String)
}
