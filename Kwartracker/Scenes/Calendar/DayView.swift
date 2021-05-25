//
//  DayView.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 5/24/21.
//

import SwiftUI

struct DayView: View {
    private let size: CGFloat = 35
    private let fontSize: CGFloat = 12
    private let cornerRadius: CGFloat = 14
    private let bottomMargin: CGFloat = 10
    var day: String
    var body: some View {
        Text(day)
            .foregroundColor(Color(Asset.Colors.spindleGrey.color))
            .font(.system(size: fontSize,
                          weight: .bold))
            .frame(width: size, height: size)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(Color(Asset.Colors.solitudeGreyShade2.color),
                            lineWidth: 1)
            )
            .padding([.bottom], bottomMargin)
    }
}

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        DayView(day: "30")
    }
}
