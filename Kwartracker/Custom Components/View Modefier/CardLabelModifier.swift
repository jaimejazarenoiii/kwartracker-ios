//
//  CardLabelModifier.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 5/7/21.
//

import SwiftUI

struct CardLabel: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 12, weight: .medium))
            .foregroundColor(Color.white.opacity(0.5))
            .fixedSize(horizontal: false, vertical: true)
            .frame(minHeight: 15)
    }
}
