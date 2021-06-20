//
//  CardValueModifier.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 5/7/21.
//

import SwiftUI

struct CardLabelValue: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 21, weight: .medium))
            .foregroundColor(Color.white)
            .fixedSize(horizontal: false, vertical: true)
            .frame(minHeight: 27)
    }
}

