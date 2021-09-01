//
//  SecureTextFieldForm.swift
//  Kwartracker
//
//  Created by Jacob on 8/30/21.
//

import SwiftUI

struct SecureTextFieldForm: View {
    var label: String
    var placeholder: String
    @Binding var inputValue: String

    private let blackShadow = Color.black.opacity(0.2)
    private let whiteShadow = Color.white.opacity(0.7)
    private let shadowRadius: CGFloat = 10
    private let blackShadowXY: CGFloat = 10
    private let whiteShadowXY: CGFloat = -5
    private let textFieldPaddingLeftRight: CGFloat = 15
    private let textFieldContainerHeight: CGFloat = 48

    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .foregroundColor(Color(Asset.Colors.spindleGrey.color))
                .font(.textFieldFont)
            
            ZStack {
                Rectangle()
                    .fill(Color(Asset.Colors.solitudeGrey.color))
                    .cornerRadius(10, corners: [.allCorners])
                    .shadow(color: blackShadow, radius: shadowRadius, x: blackShadowXY, y: blackShadowXY)
                    .shadow(color: whiteShadow, radius: shadowRadius, x: whiteShadowXY, y: whiteShadowXY)

                SecureField(placeholder, text: $inputValue)
                    .font(.textFieldFont)
                    .padding([.leading, .trailing], textFieldPaddingLeftRight)
            }
            .frame(height: textFieldContainerHeight)
        }
    }
}

extension Font {
    static let textFieldFont = Font.system(size: 16)
}
