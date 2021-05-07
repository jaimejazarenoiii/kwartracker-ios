//
//  WalletPageView.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 4/20/21.
//

import SwiftUI

struct WalletPageView: View {
    @State private var topMargin: CGFloat = 30
    var body: some View {
        AuthLayoutView {
            SignInHeaderView()
        } content: {
            ScrollView(showsIndicators: true) {
                VStack {
                    WalletOneCardCenterView()
                    WalletActionButtonView()
                }
                .padding(.top, topMargin)
            }.background(Color.white)
        }
    }
}

struct WalletPageView_Previews: PreviewProvider {
    static var previews: some View {
        WalletPageView()
    }
}
