//
//  Secrets.swift
//  Kwartracker
//
//  Created by Jacob on 3/27/21.
//

import Foundation

enum Secrets {
    static let demoSecretEndpoint: String = {
        Secrets.decode([123,123,12,31])
    }()

    private static func decode(_ encoded: [UInt8]) -> String {
        Obfuscate().reveal(key: encoded)
    }
}
