//
//  WalletSectionHeader.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 5/12/21.
//

import SwiftUI

struct WalletSectionHeader: View {
    private let fontSizeHeader: CGFloat = 16
    private let fontSizLabel: CGFloat = 12
    var body: some View {
        HStack {
            Text(L10n.TransactionsPage.titleBar)
                .font(.system(size: fontSizeHeader, weight: .bold))
                .foregroundColor(Color(Asset.Colors.charcoal.color))
            
            Spacer()
            Button(action: {
            }, label: {
                Text(L10n.viewAll)
                    .font(.system(size: fontSizLabel, weight: .bold))
                    .underline()
                    .foregroundColor(Color(Asset.Colors.spindleGrey.color))
            })
            
        }
        .frame(width: UIScreen.main.bounds.width * 0.8)
    }
}

struct WalletSectionHeader_Previews: PreviewProvider {
    static var previews: some View {
        WalletSectionHeader()
    }
}
