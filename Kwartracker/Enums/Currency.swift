//
//  Currency.swift
//  Kwartracker
//
//  Created by Jacob on 4/26/21.
//

import Foundation

enum Currency {
    case philippinePeso
    case usDollar
    
    static func getType(_ locale: String) -> Currency {
        switch locale {
        case "fil_PH": return .philippinePeso
        case "en_US": return .usDollar
        default: return .philippinePeso
        }
    }

    var localeNumberFormat: String {
        switch self {
        case .philippinePeso: return "fil_PH"
        case .usDollar: return "en_US"
        }
    }
    
    var stringValue: String {
        switch self {
        case .philippinePeso: return "Philippine Peso"
        case .usDollar: return "US Dollar"
        }
    }
}
