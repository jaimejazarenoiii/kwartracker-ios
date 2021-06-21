//
//  AuthenticationService.swift
//  Kwartracker
//
//  Created by Jacob on 6/20/21.
//

import Apollo

protocol AuthenticationServiceDelegate {
    func signIn(
        credentialInput input: CredentialsInput,
        completion: @escaping (Result<GraphQLResult<SignInMutation.Data>, Error>) -> Void
    ) -> Cancellable
    func signUp(
        signUpCredential input: SignUpWithEmailInput,
        completion: @escaping (Result<GraphQLResult<SignUpMutation.Data>, Error>) -> Void
    ) -> Cancellable
}

struct AuthenticationService: AuthenticationServiceDelegate {
    @discardableResult func signIn(
        credentialInput input: CredentialsInput,
        completion: @escaping (Result<GraphQLResult<SignInMutation.Data>, Error>) -> Void
    ) -> Cancellable {
        Network.shared.apollo
            .perform(
                mutation: SignInMutation(signInCredential: input),
                resultHandler: { completion($0) }
            )
    }

    @discardableResult func signUp(
        signUpCredential input: SignUpWithEmailInput,
        completion: @escaping (Result<GraphQLResult<SignUpMutation.Data>, Error>) -> Void
    ) -> Cancellable {
        Network.shared.apollo
            .perform(
                mutation: SignUpMutation(signUpEmailInput: input),
                resultHandler: { completion($0)}
            )
    }
}
