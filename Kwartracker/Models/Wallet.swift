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
    var type: WalletType = .none
    var currency: Int = 0
    var total: Double = 0
    var targetAmount: Double = 0
    var targetRawDate: String = ""
    var savedTo: String = ""
    var includeToOverallTotalBalance: Bool = true
    
    var isAllowedToSave: Bool {
        !title.isEmpty &&
            !savedTo.isEmpty &&
            type != .none &&
            currencyObj != nil
    }
    
    var targetAmountWithCommas: String {
        get {
            targetAmount.amountOnCurrency(currency: currencyObj?.localeNumberFormat ??
                                    Currency.philippinePeso.localeNumberFormat)
        }
        set {
            targetAmount = newValue.toDoubleWith(currency: currencyObj?.localeNumberFormat ??
                                                    Currency.philippinePeso.localeNumberFormat)
        }
    }
    
    var currencyStr: String? {
        get {
            let newCurrency = currencyObj ?? .philippinePeso
            return newCurrency.localeNumberFormat
        }
        set {
            let defaultValue = Currency.philippinePeso
            currencyObj = Currency.getType(newValue ?? defaultValue.localeNumberFormat)
            
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
    
    var currencyObj: Currency? {
        get {
            Currency.getType(by: currency)
        }
        set {
            currency = newValue?.hashValue ?? 0
        }
    }
    
    var remainingAmountNeeded: String {
        let amount = targetAmount - total
        return amount.amountOnCurrency(currency: currencyObj?.localeNumberFormat ??
                                        Currency.philippinePeso.localeNumberFormat)
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
            currencyObj != nil &&
            dateTime != nil {
            return nil
        }
        return "Please fill up required fields (title, category)"
    }
}
