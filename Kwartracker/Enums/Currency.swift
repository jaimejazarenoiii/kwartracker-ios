//
//  Currency.swift
//  Kwartracker
//
//  Created by Jacob on 4/26/21.
//

import Foundation

enum Currency: Int {
    case philippinePeso
    case usDollar

    var localeNumberFormat: String {
        switch self {
        case .philippinePeso: return "fil_PH"
        case .usDollar: return "en_US"
        }
    }
}
