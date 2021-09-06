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
    typealias RawValue = CurrencyValue
    
    struct CurrencyValue {
        let id: Int
        let locale: String
        let stringValue: String
        
        static var philippinePeso: CurrencyValue {
            return CurrencyValue(id: 0, locale: "fil_PH", stringValue: "php")
        }
        
        static var usDollar: CurrencyValue {
            return CurrencyValue(id: 1, locale: "en_US", stringValue: "usd")
        }
    }
    
    var rawValue: RawValue {
        switch self {
        case .philippinePeso:
            return .philippinePeso
        case .usDollar:
            return .usDollar
        }
    }
    
    init?(stringValue: String) {
        switch stringValue {
        case "php":
            self = .philippinePeso
        case "usd":
            self = .usDollar
        default: return nil
        }
    }
    
    init?(id: Int) {
        switch id {
        case 0:
            self = .philippinePeso
        case 1:
            self = .usDollar
        default: return nil
        }
    }
}
