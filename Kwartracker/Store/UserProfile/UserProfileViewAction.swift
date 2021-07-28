//
//  UserProfileViewAction.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 6/22/21.
//

import Foundation

enum UserProfileViewAction {
    case fetchProfile
    case setUserDetail(_ user: FetchProfileQuery.Data.Profile?)
    case errorMessage(_ string: String)
}
