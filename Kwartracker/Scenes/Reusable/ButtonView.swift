//
//  ButtonView.swift
//  Kwartracker
//
//  Created by Veverly Mae Ricaza Veverly on 4/27/21.
//

import SwiftUI

struct ButtonView: View {
    let actionHandler: (() -> Void)
    let actionLabel: DialogStatus
    
    private let shadowRadius: CGFloat = 8
    private let shadowOffset = CGPoint(x: 6, y: 6)
    private let rectRadius: CGFloat = 17
    private let fontSize: CGFloat = 14
    
    var body: some View {
        Button(action: actionHandler, label: {
            ZStack {
                BWNeumorphicRectangle(rectRadius: rectRadius,
                                      color: Color(Asset.Colors.blueberry.color),
                                      shadowRadius: shadowRadius,
                                      shadowOffset: shadowOffset)
                Text(actionLabel.title)
                    .foregroundColor(.white)
                    .font(.system(size: fontSize))
            }
        })
    }
}
