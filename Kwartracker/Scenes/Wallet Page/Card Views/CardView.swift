//
//  CardView.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 4/20/21.
//

import SwiftUI

struct CardView: View {
    @State private var bubbleOpacity: Double = 0.18
    @State private var bubbleRadiusBlur: CGFloat = 3.0
    @State private var cornerRadius: CGFloat = 25
    // value will be passed later
    @State private var cardColorName: String = Asset.Colors.mintGreen.name
    var cardSize: CGSize
    var wallet: Wallet
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color(cardColorName).blur(radius: 1.0)
            Circle()
                .fill(Color.white)
                .frame(width: 60)
                .opacity(bubbleOpacity)
                .offset(x: cardSize.width / 1.7,
                        y: -(cardSize.height / 10))
                .blur(radius: bubbleRadiusBlur)
            Circle()
                .fill(Color.white)
                .frame(width: 140)
                .opacity(bubbleOpacity)
                .offset(x: cardSize.width / 2,
                        y: cardSize.height / 2.8)
                .blur(radius: bubbleRadiusBlur)
            VStack(alignment: .leading) {
                Text(wallet.type.uppercased())
                    .modifier(CardLabel())
                Text(wallet.title)
                    .modifier(CardLabelValue())
                
                VStack(alignment: .leading) {
                    Text(L10n.Card.Title.availableBalance.uppercased())
                        .modifier(CardLabel())
                    Text(wallet.total.withCommas)
                        .modifier(CardLabelValue())
                }.padding([.top, .bottom], 2)
            }.padding([.leading], 25)
        }
        .frame(width: cardSize.width, height: cardSize.height)
        .cornerRadius(cornerRadius)
        .clipped()
        .shadow(color: Color(cardColorName).opacity(0.3),
            radius: 5, x: 0, y: 15)
    }
}
