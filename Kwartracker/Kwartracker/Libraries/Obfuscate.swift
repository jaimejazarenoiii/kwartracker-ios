//
//  Obfuscate.swift
//  Kwartracker
//
//  Created by Jacob on 3/27/21.
//
// Source code: https://gist.github.com/DejanEnspyra/80e259e3c9adf5e46632631b49cd1007
import Foundation

class Obfuscate {

    // MARK: - Variables

    /// The salt used to obfuscate and reveal the string.
    private var salt: String

    // MARK: - Initialization

    init(with salt: String = String(describing: KwartrackerApp.self)) {
        self.salt = salt
    }

    // MARK: - Instance Methods

    /**
     This method obfuscates the string passed in using the salt
     that was used when the Obfuscator was initialized.

     - parameter string: the string to obfuscate

     - returns: the obfuscated string in a byte array
     */
    func bytesByObfuscatingString(string: String) -> [UInt8] {
        let text = [UInt8](string.utf8)
        let cipher = [UInt8](self.salt.utf8)
        let length = cipher.count

        var encrypted = [UInt8]()

        for letter in text.enumerated() {
            encrypted.append(letter.element ^ cipher[letter.offset % length])
        }

        return encrypted
    }

    /**
     This method reveals the original string from the obfuscated
     byte array passed in. The salt must be the same as the one
     used to encrypt it in the first place.

     - parameter key: the byte array to reveal

     - returns: the original string
     */
    func reveal(key: [UInt8]) -> String {
        let cipher = [UInt8](self.salt.utf8)
        let length = cipher.count

        var decrypted = [UInt8]()

        for number in key.enumerated() {
            decrypted.append(number.element ^ cipher[number.offset % length])
        }

        return String(bytes: decrypted, encoding: .utf8)!
    }
}
