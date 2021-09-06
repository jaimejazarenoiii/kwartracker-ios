//
//  SelectedDayView.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 5/27/21.
//

import SwiftUI

struct SelectedDayView: View {
    private let size: CGFloat = 35
    private let fontSize: CGFloat = 12
    private let cornerRadius: CGFloat = 14
    private let bottomMargin: CGFloat = 5
    var day: String
    var body: some View {
        Text(day)
            .foregroundColor(.white)
            .font(.system(size: fontSize,
                          weight: .bold))
            .frame(width: size, height: size)
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color(Asset.Colors.quartz.color))
            )
            .padding([.bottom], bottomMargin)
    }
}

struct SelectedDayView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedDayView(day: "30")
    }
}
