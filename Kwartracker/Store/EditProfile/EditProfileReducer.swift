//
//  EditProfileReducer.swift
//  Kwartracker
//
//  Created by Jacob on 9/5/21.
//

import Combine
import CocoaLumberjackSwift

func editProfileReducer(state: inout EditProfileState,
                        action: EditProfileAction,
                        environment: World) -> AnyPublisher<EditProfileAction, Never> {
    switch action {
    case .submit(let input):
        if let errorMessage = input.saveValidationErrorMessage {
            state.errorMessage = errorMessage
        } else {
            state.isRequesting = true
            return environment.userProfileService.updateProfile(input: input.convertToUpdateProfileInput)
                .map { EditProfileAction.success(response: $0) }
                .catch { Just(EditProfileAction.failed(error: $0)) }
                .eraseToAnyPublisher()
        }
        break
    case .clearErrorMessage:
        state.errorMessage = nil
        break
    case .success(let response):
        state.isRequesting = false
        DDLogInfo("[EditProfile] response: \(response)")
        break
    case .failed(let error):
        state.isRequesting = false
        state.errorMessage = error.localizedDescription
        DDLogError("[EditProfile] error: \(error)")
        break
    }
    return Empty().eraseToAnyPublisher()
}

