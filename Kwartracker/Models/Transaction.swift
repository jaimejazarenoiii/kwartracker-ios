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
    var wallet: Wallet = Wallet()
    var rawDateTime: String = ""
    var recurring: Bool = false
    var with: String = ""
    var photoRawURL: String = ""
    var photoImg: Imageable? = nil

    var dateTime: Date? {
        rawDateTime.toDate("yyyy-MM-dd HH:mm")?.date
    }
}
