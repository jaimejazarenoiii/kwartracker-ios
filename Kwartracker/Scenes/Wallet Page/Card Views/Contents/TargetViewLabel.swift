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
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(targetValue)
                .font(.system(size: 14,
                              weight: .bold))
                .foregroundColor(Color(Asset.Colors.teal.color))
            Text(bottomLabel)
                .font(.system(size: 12))
                .foregroundColor(Color(Asset.Colors.nightRider.color))
        }
    }
}

struct TargetViewLabel_Previews: PreviewProvider {
    static var previews: some View {
        TargetViewLabel(bottomLabel: L10n.Wallet.Target.toTargetAmount, targetValue: "70,000.00")
    }
}
