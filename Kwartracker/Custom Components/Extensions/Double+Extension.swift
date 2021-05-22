//
//  Double+Extension.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 5/14/21.
//

import Foundation
extension Double {
    var withCommas: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = .current
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.decimalSeparator = "."
        return numberFormatter.string(from: NSNumber(value: self)) ?? ""
    }
    
    func amountOnCurrency(currency: String) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.decimalSeparator = "."
        formatter.locale = Locale(identifier: currency)
        return formatter.string(from: NSNumber(value: self)) ?? "0"
    }
}
