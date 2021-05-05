//
//  RoundedCorner.swift
//  Kwartracker
//
//  Created by John Ellie Go on 4/15/21.
//

import SwiftUI

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let size = CGSize(width: radius, height: radius)
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: size)
        return Path(path.cgPath)
    }
}
