//
//  View+Extensions.swift
//  Kwartracker
//
//  Created by John Ellie Go on 4/15/21.
//

import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}
