//
//  KeyChainKeys.swift
//  Kwartracker
//
//  Created by Jacob on 5/17/21.
//

import KeychainSwift

enum KeyChainKeys {
    static let loginTokenKey = "loginToken"

    static func getLoginKeyChain() -> String {
        if let data = KeyChain.load(key: loginTokenKey) {
            if let loginToken = String(data: data, encoding: .utf8) {
                return loginToken
            }
        }
        
        return ""
    }

    static func isLoggedIn() -> Bool {
        !getLoginKeyChain().isEmpty
    }
}
