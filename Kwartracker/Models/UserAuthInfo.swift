//
//  UserAuthentication.swift
//  Kwartracker
//
//  Created by John Ellie Go on 6/18/21.
//

import Foundation

struct UserAuthInfo {
    var email: String = ""
    var password: String = ""

    /// Returns true if email is invalid
    var isValidEmail: Bool {
        Validator.isValidEmail(email: email)
    }

    /// Returns string if has error
    var validationErrorMessage: String? {
        var message: String? = nil
        if email.isEmpty {
            message = L10n.MainAlertView.emailIsRequiredMessage
        } else if password.isEmpty {
            message = L10n.MainAlertView.passwordIsRequiredMessage
        } else if !email.isEmpty && !isValidEmail {
            message = L10n.MainAlertView.invalidEmailFormatMessage
        }
        return message
    }
}
