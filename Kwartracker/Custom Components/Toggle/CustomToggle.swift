//
//  CustomToggle.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 6/1/21.
//

import SwiftUI

struct CustomToggle: ToggleStyle {
    let onText: String
    let offText: String

    private let outerRectangleRadius: CGFloat = 15
    private let outerRectangleWidth: CGFloat = 60
    private let outerRectangleHeight: CGFloat = 40
    private let innerRectangleSize: CGFloat = 30
    private let innerRectangleRadius: CGFloat = 12
    private let innerRectangleOffset: CGFloat = 11
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Text(onText)
                .fontWeight(.bold)
                .foregroundColor(configuration.isOn ?
                                    Color(Asset.Colors.nightRider.color) :
                                    Color(Asset.Colors.spindleGrey.color))
            RoundedRectangle(cornerRadius: outerRectangleRadius)
                .frame(width: outerRectangleWidth, height: outerRectangleHeight, alignment: .center)
                .foregroundColor(Color(Asset.Colors.solitudeGrey.color))
                .overlay(
                    RoundedRectangle(cornerRadius: innerRectangleRadius)
                        .foregroundColor(configuration.isOn ?
                                            Color(Asset.Colors.teal.color) :
                                            Color(Asset.Colors.spindleGrey.color))
                        .frame(width: innerRectangleSize, height: innerRectangleSize, alignment: .center)
                        .offset(x: configuration.isOn ? -innerRectangleOffset : innerRectangleOffset, y: 0)
                )
                .onTapGesture {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        withAnimation(.linear(duration: 0.2)) {
                            configuration.isOn.toggle()
                        }
                    }
                }
            Text(offText)
                .fontWeight(.bold)
                .foregroundColor(!configuration.isOn ?
                                    Color(Asset.Colors.nightRider.color) :
                                    Color(Asset.Colors.spindleGrey.color))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
