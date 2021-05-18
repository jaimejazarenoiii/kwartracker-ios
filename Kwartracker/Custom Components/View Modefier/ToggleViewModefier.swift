//
//  ToggleViewModefier.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 5/18/21.
//

import SwiftUI

struct ToggleViewModefier: ToggleStyle {
    private let rectSize: CGSize = CGSize(width: 60, height: 38)
    private let padding: CGFloat = 4
    private let innerRectSize: CGFloat = 30
    private let cornerRadius: CGFloat = 10
    private let activeColor: Color = Color(Asset.Colors.teal.color)
    private let inactiveColor: Color = Color(Asset.Colors.spindleGrey.color)
    private let shadowRadius: CGFloat = 8
    private let shadowOffset = CGPoint(x: 6, y: 6)
    private let rectRadius: CGFloat = 17
    private let opacity: Double = 0.15
    
    func makeBody(configuration: Configuration) -> some View {
        // Insert custom View code here.
        HStack {
            configuration.label

            ZStack(alignment: configuration.isOn ? .leading : .trailing) {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .frame(width: rectSize.width, height: rectSize.height)
                    .foregroundColor(Color(Asset.Colors.solitudeGrey.color))
                    .shadow(color: Color.white, radius: shadowRadius, x: -shadowOffset.x, y: -shadowOffset.y)
                    .shadow(color: Color.black.opacity(opacity),
                            radius: shadowRadius, x: shadowOffset.x, y: shadowOffset.y)
                
                RoundedRectangle(cornerRadius: cornerRadius)
                    .frame(width: innerRectSize - 4, height: innerRectSize - 6)
                    .padding(padding)
                    .foregroundColor(configuration.isOn ? activeColor : inactiveColor)
                    .onTapGesture {
                        withAnimation {
                            configuration.$isOn.wrappedValue.toggle()
                        }
                }
            }
        }
    }
}
