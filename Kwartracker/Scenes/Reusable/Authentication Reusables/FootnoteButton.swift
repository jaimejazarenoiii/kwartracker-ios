//
//  FootnoteButton.swift
//  Kwartracker
//
//  Created by John Ellie Go on 4/27/21.
//

import SwiftUI

struct FootnoteButton: View {
    let action: () -> Void
    let text: String
    
    var fontWeight: Font.Weight = .regular
    var color: Color = Color(Asset.Colors.spindleGrey.color)
    
    var body: some View {
        Button(action: {}, label: {
            Text(text)
                .font(.footnote)
                .fontWeight(fontWeight)
                .foregroundColor(color)
                .underline()
        })
    }
}

