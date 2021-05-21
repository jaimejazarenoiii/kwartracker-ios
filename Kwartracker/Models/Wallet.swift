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
    var currency: Currency?
    var total: Double = 0
    var targetRawDate: String = ""
    var savedTo: String = ""
    var includeToOverallTotalBalance: Bool = true
    
    var isAllowedToSave: Bool {
        return !title.isEmpty &&
            !savedTo.isEmpty &&
            type != .none &&
            currency != nil
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
