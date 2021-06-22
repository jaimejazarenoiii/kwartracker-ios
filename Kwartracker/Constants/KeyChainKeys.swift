//
//  KeyChainKeys.swift
//  Kwartracker
//
//  Created by Jacob on 5/17/21.
//

import KeychainSwift

enum KeyChainKeys {
    static let loginKey = "login"
    static let userTokenKey = "userToken"

    static func getLoginKeyChain() -> String {
        KeychainSwift().get(loginKey) ?? ""
    }

    static func isLoggedIn() -> Bool {
        !getLoginKeyChain().isEmpty
    }
}
