//
//  Keychain+Extensions.swift
//  Kwartracker
//
//  Created by John Ellie Go on 6/21/21.
//

import Security
import UIKit

// https://stackoverflow.com/a/37539998
class KeyChain {

    class func save(key: String, value: String) -> OSStatus {
        guard let data = value.data(using: String.Encoding.utf8) else {
            debugPrint("Unable to parse string into utf-8 data!")
            return noErr
        }
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword as String,
            kSecAttrAccount as String: key,
            kSecValueData as String: data
        ]

        SecItemDelete(query as CFDictionary)

        return SecItemAdd(query as CFDictionary, nil)
    }

    class func load(key: String) -> Data? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]

        var result: AnyObject?
        
        let status = withUnsafeMutablePointer(to: &result) {
          SecItemCopyMatching(query as CFDictionary, UnsafeMutablePointer($0))
        }
        
        return status == noErr ? result as? Data : nil
    }
    
    class func delete(key: String) -> OSStatus {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword as String,
            kSecAttrAccount as String: key
        ]

        return SecItemDelete(query as CFDictionary)
    }

    class func createUniqueID() -> String {
        let uuid: CFUUID = CFUUIDCreate(nil)
        let cfStr: CFString = CFUUIDCreateString(nil, uuid)

        let swiftString: String = cfStr as String
        return swiftString
    }
}
