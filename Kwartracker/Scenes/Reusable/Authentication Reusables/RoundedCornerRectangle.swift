//
//  RoundedCornerRectangle.swift
//  Kwartracker
//
//  Created by John Ellie Go on 5/6/21.
//

import SwiftUI

struct RoundedCornerRectangle: View {
    let radius: CGFloat
    let corner: UIRectCorner
    
    var body: some View {
        Rectangle()
            .fill(Color(Asset.Colors.solitudeGrey.color))
            .cornerRadius(radius, corners: corner)
            .edgesIgnoringSafeArea(.bottom)
    }
}
