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
    var user: FetchProfileQuery.Data.Profile? = nil
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
    case .setUserDetail(let user):
        state.user = user
    case .errorMessage(let string):
        state.errorMessage = string
    }
    
    return Empty().eraseToAnyPublisher()
}
