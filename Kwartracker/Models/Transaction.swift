//
//  Transaction.swift
//  Kwartracker
//
//  Created by Jacob on 4/25/21.
//

import Foundation
import SwiftDate

struct Transaction {
    var id: Int = 0
    var title: String = ""
    var category: Category
    var amount: Double = 0
    var wallet: Wallet = Wallet(id: 0)
    var rawDateTime: String = ""
    var recurring: Bool = false
    var with: String = ""
    var photoRawURL: String = ""
    var photoImg: Imageable? = nil

    var dateTime: Date? {
        rawDateTime.toDate("yyyy-MM-dd")?.date
    }

    var amountCurrencyDisplay: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        let currency = wallet.currency ?? .philippinePeso
        formatter.locale = Locale(identifier: currency.rawValue.locale)
        return formatter.string(from: NSNumber(value: amount)) ?? "0"
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

    var dayDisplay: String {
        if let day = dateTime?.day {
            return "\(day)"
        }
        return "01"
    }

    var monthDisplay: String {
        dateTime?.monthInString ?? "JAN"
    }

    func createTransactionErrorMessage() -> String? {
        if !title.isEmpty &&
            !category.title.isEmpty &&
            dateTime != nil {
            return nil
        }
        return "Please fill up required fields (title, category)"
    }
}

extension Transaction {
    static let unitTestTransaction = Transaction(id: 1,
                                                 title: "Side hustle",
                                                 category: Category(id: 1, title: "Money on hand"),
                                                 amount: 5000,
                                                 rawDateTime: "2021-04-01")
    static let unitTestInvalidTransaction = Transaction(id: 0,
                                                        title: "Side hustle",
                                                        category: Category(id: 2, title: "Money on hand"))
}
