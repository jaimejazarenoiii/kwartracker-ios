//
//  TextFieldForm.swift
//  Kwartracker
//
//  Created by Jacob on 5/11/21.
//

import SwiftUI

struct TextFieldForm: View {
    var label: String
    var placeholder: String
    @Binding var inputValue: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .foregroundColor(Color(Asset.Colors.spindleGrey.color))
                .font(.system(size: 15))
            ZStack {
                Rectangle()
                    .fill(Color(Asset.Colors.solitudeGrey.color))
                    .cornerRadius(10, corners: [.allCorners])
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)

                TextField(placeholder, text: $inputValue)
                    .font(.system(size: 16))
                    .padding([.leading, .trailing], 15)
            }
            .frame(height: 48)
        }
    }
}

struct TextFieldForm_Previews: PreviewProvider {
    @State static var inputValue = ""
    static var previews: some View {
        TextFieldForm(label: "Transaction name", placeholder: "Enter transaction name", inputValue: $inputValue)
    }
}
