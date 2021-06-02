//
//  Date+Extensions.swift
//  Kwartracker
//
//  Created by Jacob on 5/31/21.
//

import Foundation

extension Date {
    var dayInString: String {
        "\(day)"
    }

    var monthInString: String {
        toFormat("MMM")
    }
}
