//
//  PageControlView.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 4/27/21.
//

import SwiftUI

struct PageControl: View {
    @Binding var index: Int
    let maxIndex: Int

    var body: some View {
        HStack(spacing: 5) {
            ForEach(1...maxIndex, id: \.self) { index in
                RoundedRectangle(cornerRadius: 5, style: .continuous)
                    .fill(index == self.index ?
                            Color(Asset.Colors.teal.name) :
                            Color(Asset.Colors.solitudeGrey.name))
                    .frame(width: index == self.index ? 20 : 10,
                           height: 10)
            }
        }
    }
}
