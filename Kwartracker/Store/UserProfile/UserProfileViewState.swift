//
//  UserProfileViewState.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 6/22/21.
//

import Foundation
import SwiftUI
import Combine

struct UserProfileViewState {
    var user: UserProfile? = nil
    var isRequesting: Bool = false
    var errorMessage: String?
}

func userProfileReducer(
    state: inout UserProfileViewState,
    action: UserProfileViewAction,
    environment: World
) -> AnyPublisher<UserProfileViewAction, Never> {
    switch action {
    case .fetchProfile:
        guard !state.isRequesting else { break }
        state.isRequesting = true
        return environment.userProfileService.getProfile()
            .map {
                UserProfileViewAction.setUserDetail($0.profile)
            }
            .catch { Just(UserProfileViewAction.errorMessage($0.localizedDescription)) }
            .assertNoFailure()
            .eraseToAnyPublisher()
    case .setUserDetail:
        state.isRequesting = false
        state.user = UserDefaults.standard.retrieveUserProfile()
        break
    case .errorMessage(let string):
        state.isRequesting = false
        state.errorMessage = string
        break
    }
    
    return Empty().eraseToAnyPublisher()
}
