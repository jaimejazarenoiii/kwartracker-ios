//
//  LinearGradient+Extensions.swift
//  Kwartracker
//
//  Created by Jacob on 4/16/21.
//

import SwiftUI

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(
            gradient: Gradient(colors: colors),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}
