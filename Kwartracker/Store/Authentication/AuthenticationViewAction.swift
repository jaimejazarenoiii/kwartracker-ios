//
//  AuthenticationViewAction.swift
//  Kwartracker
//
//  Created by John Ellie Go on 6/18/21.
//

import Foundation

enum AuthenticationViewAction {
    case create(user: UserAuthInfo)
    case login(user: UserAuthInfo)
    case setUserToken(token: String?)
    case setErrorMessage(message: String?)
    case logout
}
