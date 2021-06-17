//
//  String+Extension.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 5/22/21.
//

import Foundation

extension String {
    func toDoubleWith(currency: String) -> Double {
        let formater = NumberFormatter()
        formater.numberStyle = .decimal
        formater.locale = Locale(identifier: currency)
        return formater.number(from: self) as? Double ?? 0
    }
}
