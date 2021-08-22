//
//  TargetViewLabel.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 5/14/21.
//

import SwiftUI

struct TargetViewLabel: View {
    var bottomLabel: String
    var targetValue: String
    private let spacing: CGFloat = 2
    private let targetValueFontSize: CGFloat = 14
    private let bottomLabelFontSize: CGFloat = 12
    var body: some View {
        VStack(alignment: .leading, spacing: spacing) {
            Text(targetValue)
                .font(.system(size: targetValueFontSize,
                              weight: .bold))
                .foregroundColor(Color(Asset.Colors.teal.color))
            Text(bottomLabel)
                .font(.system(size: bottomLabelFontSize))
                .foregroundColor(Color(Asset.Colors.nightRider.color))
        }
    }
}

struct TargetViewLabel_Previews: PreviewProvider {
    static var previews: some View {
        TargetViewLabel(bottomLabel: L10n.Wallet.Target.toTargetAmount, targetValue: "70,000.00")
    }
}
