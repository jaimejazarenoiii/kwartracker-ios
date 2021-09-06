//
//  ChangePasswordReducer.swift
//  Kwartracker
//
//  Created by Jacob on 9/1/21.
//

import Combine

func changePasswordReducer(state: inout ChangePasswordState,
                           action: ChangePasswordAction,
                           environment: World) -> AnyPublisher<ChangePasswordAction, Never> {
    switch action {
    case .submit(let password, let confirmPassword):
        var errorMessage: String? = nil
        if password.isEmpty {
            errorMessage = "New password is required."
        } else if confirmPassword.isEmpty {
            errorMessage = "Confirm Password is required."
        } else if !password.isEmpty && !confirmPassword.isEmpty &&
                    password != confirmPassword {
            errorMessage = "New password and Confirm password does not match."
        }
        
        if let errorMessage = errorMessage {
            state.errorMessage = errorMessage
        } else {
            // Run submission or api request
        }
        break
    case .clearErrorMessage:
        state.errorMessage = nil
        break
    }
    return Empty().eraseToAnyPublisher()
}
