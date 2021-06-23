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
    var errorMessage: String?
}

func userProfileReducer(
    state: inout UserProfileViewState,
    action: UserProfileViewAction,
    environment: World
) -> AnyPublisher<UserProfileViewAction, Never> {
    switch action {
        case .fetchProfile(let store):
            environment.userProfileService.getProfile() { result in
                switch result {
                    case .success(let response):
                        if let data = response.data?.profile {
                            DispatchQueue.main.async {
                                store.send(.userProfileView(action: .setUserDetail(data)))
                                print(data, "inside reducer")
                            }
                        }
                    break
                    case .failure(let error):
                        print("Fetching user data error in \(error)")
                    break
                }
            }
        break
        case .setUserDetail(let user):
            state.user = user
        case .errorMessage(let string):
            state.errorMessage = string
    }
    
    return Empty().eraseToAnyPublisher()
}
