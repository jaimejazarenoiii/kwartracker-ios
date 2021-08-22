//
//  Wallet.swift
//  Kwartracker
//
//  Created by Jacob on 4/25/21.
//

import Foundation

struct Wallet {
    var id: Int
    var title: String = ""
    var type: WalletType = .savings
    var currency: Currency?
    var targetAmount: Double = 0
    var targetRawDate: String = ""
    var savedTo: String = ""
    var includeToOverallTotalBalance: Bool = true
    var transactions = [Transaction]()
    
    var total: Double {
        transactions.map({$0.amount}).reduce(.zero, +)
    }
    
    var isAllowedToSave: Bool {
        !title.isEmpty &&
            !savedTo.isEmpty &&
            type != .none &&
            currency != nil
    }
    
    var targetAmountWithCommas: String {
        get {
            let value = currency ?? .philippinePeso
            return targetAmount.amountOnCurrency(currency: value.rawValue.locale)
        }
        set {
            let value = currency ?? .philippinePeso
            targetAmount = newValue.toDoubleWith(currency: value.rawValue.locale)
        }
    }
    
    var currencyStr: String? {
        get {
            let newCurrency = currency ?? Currency.philippinePeso
            return newCurrency.rawValue.stringValue
        }
        set {
            let value = newValue ?? Currency.philippinePeso.rawValue.stringValue
            currency = Currency(stringValue: value)
        }
    }
    
    var walletTypeStr: String? {
        get {
            return type.stringValue
        }
        set {
            type = WalletType.getType(newValue ?? "")
            
        }
    }
    
    
    var remainingAmountNeeded: String {
        let amount = targetAmount - total
        let currencyVal = currency ?? .philippinePeso
        return amount.amountOnCurrency(currency: currencyVal.rawValue.locale)
    }
    
    var dateTime: Date? {
        targetRawDate.toDate("yyyy-MM-dd")?.date
    }
    
    var targetDateCount: DateComponents? {
        guard let date = dateTime else { return nil }

        let diffs = Calendar.current.dateComponents([.year, .month, .day], from: Date(), to: date)
        return diffs
    }

    func createWalletErrorMessage() -> String? {
        if !title.isEmpty &&
            currency != nil &&
            dateTime != nil {
            return nil
        }
        return "Please fill up required fields (title, category)"
    }
}
