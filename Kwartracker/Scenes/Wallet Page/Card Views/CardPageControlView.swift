//
//  CardPageControlView.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 4/27/21.
//

import SwiftUI

struct CardPageControlView: View {
    @Binding var index: Int
    let maxIndex: Int
    private let initialValue: Int = 1
    private let unselectedSize: CGFloat = 10
    private let selectedSize: CGFloat = 20
    private let spacing: CGFloat = 5
    private let cornerRadius: CGFloat = 5

    var body: some View {
        HStack(spacing: spacing) {
            ForEach(initialValue...maxIndex, id: \.self) { index in
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(index == self.index ?
                            Color(Asset.Colors.teal.name) :
                            Color(Asset.Colors.solitudeGreyShade2.name))
                    .frame(width: index == self.index ?
                            selectedSize : unselectedSize,
                           height: unselectedSize)
            }
        }
    }
}
