//
//  SizePreferenceKey.swift
//  Kwartracker
//
//  Created by John Ellie Go on 4/15/21.
//

import SwiftUI

struct SizePreferenceKey: PreferenceKey {
    typealias Value = CGSize
    static var defaultValue: Value = .zero

    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = nextValue()
    }
}
