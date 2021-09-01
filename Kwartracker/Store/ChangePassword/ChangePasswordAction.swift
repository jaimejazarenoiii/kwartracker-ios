//
//  ChangePasswordAction.swift
//  Kwartracker
//
//  Created by Jacob on 9/1/21.
//

import Foundation

enum ChangePasswordAction {
    case submit(password: String, confirmPassword: String)
    case clearErrorMessage
}
