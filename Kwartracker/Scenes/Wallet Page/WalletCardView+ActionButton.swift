//
//  WalletCardView+ActionButton.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 4/27/21.
//

import SwiftUI

extension WalletCardView {
    var WalletActionButtonView: some View {
        HStack {
            HStack {
                NavigationLink(
                    destination: AddNewWalletPage() // will change to edit later
                        .environmentObject(store),
                    isActive: $editToggle) {
                    Button(action: {
                        editToggle.toggle()
                    }, label: {
                        Image(editIconName)
                            .renderingMode(.template)
                            .foregroundColor(Color(iconColor))
                            .frame(width: buttonSize, height: buttonSize)
                    })
                    .buttonStyle(CircleButtonStyle(
                                    buttonColor: Asset.Colors.solitudeGrey.color,
                                    padding: padding))
                    Text(editLabel)
                        .font(.system(size: fontSize,
                                      weight: .bold))
                        .foregroundColor(Color(iconColor))
                }
            }
            
            Spacer()
            
            HStack {
                Button(action: {
                }, label: {
                    Image(addTransactionIcon)
                        .renderingMode(.template)
                        .foregroundColor(Color(iconColor))
                        .frame(width: buttonSize, height: buttonSize)
                })
                .buttonStyle(CircleButtonStyle(
                                buttonColor: Asset.Colors.solitudeGrey.color,
                                padding: padding))
                Text(addTransactionLabel)
                    .font(.system(size: fontSize,
                                  weight: .bold))
                    .foregroundColor(Color(iconColor))
            }
        }
        .frame(width: UIScreen.main.bounds.width * 0.8)
    }
}
