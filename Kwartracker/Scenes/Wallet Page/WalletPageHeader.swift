//
//  WalletPageHeader.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 4/20/21.
//

import SwiftUI

struct WalletPageHeader: View {
    var body: some View {
        HStack {
            Button(action: {
            }) {
                Image(Asset.Images.arrowLeftIcon.name)
                    .renderingMode(.template)
                    .foregroundColor(.white)
            }
            .frame(width: 40, height: 40)
            .buttonStyle(RoundTealButtonStyle())
            Spacer()
            Text("My Wallets")
                .font(.title3)
                .bold()
                .foregroundColor(.white)
            Spacer()
            Button(action: {
            }) {
                Image(Asset.Images.addIcon.name)
                    .renderingMode(.template)
                    .foregroundColor(Color(Asset.Colors.teal.name))
            }
            .frame(width: 40, height: 40)
            .buttonStyle(RoundWhiteButtonStyle())
        }.frame(height: 45)
    }
}

struct RoundTealButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding()
            .background(
                Circle()
                    .fill(Color(Asset.Colors.teal.name))
                    .shadow(color: Color.black.opacity(0.2),
                        radius: 10, x: 5, y: 5)
                    .shadow(color: Color.white.opacity(0.7),
                        radius: 10, x: -5, y: -5)
        )
    }
}

struct RoundWhiteButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding()
            .background(
                Circle()
                    .fill(Color.white)
                    .shadow(color: Color.black.opacity(0.2),
                        radius: 10, x: 5, y: 5)
                    .shadow(color: Color.white.opacity(0.7),
                        radius: 10, x: -5, y: -5)
        )
    }
}
