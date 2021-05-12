//
//  WalletNavigationView.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 5/12/21.
//

import SwiftUI

struct WalletNavigationView: View {
    var navigationTitle: String

    var body: some View {
        HStack {
            Spacer()
                .frame(width: 30)

            Button(action: {
            }) {
                Image(uiImage: Asset.Images.arrowLeftIconWhite.image)
                    .frame(width: 10, height: 10)
            }
            .buttonStyle(
                CircleButtonStyle(buttonColor: Asset.Colors.teal.color)
            )

            Spacer()

            Text(navigationTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .font(.title2)

            Spacer()

            Button(action: {
            }, label: {
                Image(uiImage: Asset.Images.addIconTeal.image)
                    .frame(width: 10, height: 10)
            })
            .buttonStyle(CircleButtonStyle(buttonColor: .white))

            Spacer()
                .frame(width: 30)
        }
    }
}

