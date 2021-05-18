//
//  KToggleView.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 5/18/21.
//

import Foundation
import SwiftUI

struct KToggleView: View {
    private let spacing: CGFloat = 15
    private var activeColor: Color = Color(Asset.Colors.nightRider.color)
    private var inactiveColor: Color = Color(Asset.Colors.spindleGrey.color)
    private var headerLabel: String = ""
    private var leftLabel: String = ""
    private var rightLabel: String = ""
    @Binding private var active: Bool
    
    init(isActive: Binding<Bool>, headerLabel: String,
         leftLabel: String, rightLabel: String) {
        self._active = isActive
        self.headerLabel = headerLabel
        self.leftLabel = leftLabel
        self.rightLabel = rightLabel
    }
    
    init(isActive: Binding<Bool>, leftLabel: String, rightLabel: String) {
        self._active = isActive
        self.leftLabel = leftLabel
        self.rightLabel = rightLabel
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if !headerLabel.isEmpty {
                Text(headerLabel)
                    .font(.system(size: 15))
                    .foregroundColor(inactiveColor)
                Spacer()
                    .frame(height: spacing)
            }
            HStack {
                Text(leftLabel)
                    .font(.system(size: 16,
                                  weight: .medium))
                    .foregroundColor(active ? activeColor : inactiveColor)
                Spacer()
                    .frame(width: spacing)
                Toggle(isOn: $active) {}
                .toggleStyle(ToggleViewModefier())
                Text(rightLabel)
                    .font(.system(size: 16,
                                  weight: .medium))
                    .foregroundColor(active ? inactiveColor : activeColor)
                Spacer()
                    .frame(width: spacing)
            }
        }
    }
}
