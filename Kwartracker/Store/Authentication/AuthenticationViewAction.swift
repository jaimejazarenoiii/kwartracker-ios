//
//  AuthenticationViewAction.swift
//  Kwartracker
//
//  Created by John Ellie Go on 6/18/21.
//

import Foundation

enum AuthenticationViewAction {
    case create(user: UserAuthInfo, store: AppStore)
    case login(user: UserAuthInfo, store: AppStore)
    case setUserToken(token: String)
    case setErrorMessage(message: String)
}
