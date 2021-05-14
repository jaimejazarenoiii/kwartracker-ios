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
    var type: String = ""
    var currency: Currency = .philippinePeso
    var total: Double = 0
    var targetRawDate: String = ""
    
    var dateTime: Date? {
        targetRawDate.toDate("yyyy-MM-dd")?.date
    }
    
    func getRawDateTime(format: String = "yyyy-MM-dd") -> String? {
        dateTime?.toFormat(format)
    }

    func getDay() -> String {
        "\(dateTime?.day ?? 1)"
    }

    func getMonth() -> String {
        getRawDateTime(format: "MMM") ?? ""
    }

    func createTransactionErrorMessage() -> String? {
        if !title.isEmpty &&
            !type.isEmpty &&
            dateTime != nil {
            return nil
        }
        return "Please fill up required fields (title, category)"
    }
}
