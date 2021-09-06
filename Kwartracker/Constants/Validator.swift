//
//  Validator.swift
//  Kwartracker
//
//  Created by Jacob on 8/28/21.
//

import Foundation

enum Validator {
    // VALIDATE EMAIL
    // source: https://gist.github.com/DaveWoodCom/4f751193cdb7d3767e5a
    static func isValidEmail(email: String) -> Bool {
        let types = NSTextCheckingResult.CheckingType.link.rawValue
        guard !email.hasPrefix("mailto:"),
              isValidEmailUsingRegex(email: email),
              let emailDetector = try? NSDataDetector(types: types)
        else { return false }
        let matches = emailDetector.matches(
            in: email,
            options: NSRegularExpression.MatchingOptions.anchored,
            range: NSRange(location: 0, length: email.count)
        )
        guard matches.count == 1 else { return false }
        return matches[0].url?.scheme == "mailto"
    }

    static func isValidEmailUsingRegex(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: email)
        return result
    }
}
