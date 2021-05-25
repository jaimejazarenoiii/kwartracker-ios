//
//  PlaceholderStyle.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 5/25/21.
//

import SwiftUI

struct PlaceholderStyle: ViewModifier {
    var showPlaceHolder: Bool
    var placeholder: String

    public func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if showPlaceHolder {
                Text(placeholder)
                    .italic()
                    .foregroundColor(.secondary)
            }
            content
                .foregroundColor(Color.black)
        }
    }
}
