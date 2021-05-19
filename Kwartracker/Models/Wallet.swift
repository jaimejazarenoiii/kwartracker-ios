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
    var type: Int?
    var currency: Currency = .philippinePeso
    var total: Double = 0
    var targetRawDate: String = ""
    
    var dateTime: Date? {
        targetRawDate.toDate("yyyy-MM-dd")?.date
    }
    
    var targetDateCount: DateComponents? {
        guard let date = dateTime else { return nil }

        let diffs = Calendar.current.dateComponents([.year, .month, .day], from: Date(), to: date)
        return diffs
    }

    func createTransactionErrorMessage() -> String? {
        if !title.isEmpty &&
            type != nil &&
            dateTime != nil {
            return nil
        }
        return "Please fill up required fields (title, category)"
    }
}
