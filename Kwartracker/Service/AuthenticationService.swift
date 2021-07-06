//
//  AuthenticationService.swift
//  Kwartracker
//
//  Created by Jacob on 6/20/21.
//

import SwiftUI
import Combine
import Apollo
import CocoaLumberjackSwift

protocol AuthenticationServiceDelegate {
    func signIn(
        credentialInput input: CredentialsInput
    ) -> AnyPublisher<SignInMutation.Data, Error>
    
    func signUp(
        signUpCredential input: SignUpWithEmailInput
    ) -> AnyPublisher<SignUpMutation.Data, Error>
}

struct AuthenticationService: AuthenticationServiceDelegate {
    @discardableResult func signIn(
        credentialInput input: CredentialsInput
        ) -> AnyPublisher<SignInMutation.Data, Error> {
        
        Future<SignInMutation.Data, Error> { promise in
            Network.shared.apollo.perform(
                mutation: SignInMutation(signInCredential: input)
            ) { result in
                switch result {
                case .success(let response):
                    if let data = response.data, data.signInWithEmail != nil {
                        promise(.success(data))
                    } else if let error = response.errors?.first {
                        promise(.failure(error))
                    }
                    break
                case .failure(let error):
                    DDLogError("[Authentication][sign in] error: \(error)")
                    promise(.failure(error))
                    break
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    @discardableResult func signUp(
        signUpCredential input: SignUpWithEmailInput
    ) -> AnyPublisher<SignUpMutation.Data, Error> {
        Future<SignUpMutation.Data, Error> { promise in
            Network.shared.apollo.perform(
                mutation: SignUpMutation(signUpEmailInput: input)
            ) { result in
                switch result {
                case .success(let response):
                    if let data = response.data {
                        promise(.success(data))
                    } else if let error = response.errors?.first {
                        promise(.failure(error))
                    }
                    break
                case .failure(let error):
                    DDLogError("[Authentication][sign up] error: \(error)")
                    promise(.failure(error))
                    break
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
