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
    
    func setHeightRatio(
        width: CGFloat = 0,
        baseSize: CGSize = CGSize(width: 690, height: 180))
    -> CGFloat {
        let curConstraint = baseSize.height / baseSize.width
        let newHeight = width * curConstraint
        return newHeight
    }
    
    func setWidthRatio(
        height: CGFloat = 0,
        baseSize: CGSize = CGSize(width: 690, height: 180))
    -> CGFloat {
        let curConstraint = baseSize.width / baseSize.height
        let newWidth = height * curConstraint
        return newWidth
    }
}
