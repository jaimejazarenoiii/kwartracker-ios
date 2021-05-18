//
//  CardView.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 4/20/21.
//

import SwiftUI

struct CardView: View {
    private let smallBubbleWidth: CGFloat = 60
    private let bigBubbleWidth: CGFloat = 140
    private let labelLeading: CGFloat = 25
    private let spacing: CGFloat = 30
    @State private var bubbleOpacity: Double = 0.18
    @State private var bubbleRadiusBlur: CGFloat = 3.0
    @State private var cornerRadius: CGFloat = 25
    // value will be passed later
    @State private var cardColorName: String = Asset.Colors.mintGreen.name
    
    @Binding var walletType: String
    @Binding var walletName: String
    
    var cardSize: CGSize
    var wallet: Wallet?
    
    init(size: CGSize, wallet: Wallet) {
        self.cardSize = size
        self.wallet = wallet
        
        self._walletType = Binding.constant(wallet.type)
        self._walletName = Binding.constant(wallet.title)
    }
    
    init(name: Binding<String>, type: Binding<String>, size: CGSize) {
        self._walletName = name
        self._walletType = type
        self.cardSize = size
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color(cardColorName).blur(radius: 1.0)
            Circle()
                .fill(Color.white)
                .frame(width: smallBubbleWidth)
                .opacity(bubbleOpacity)
                .offset(x: cardSize.width / 1.7,
                        y: -(cardSize.height / 10))
                .blur(radius: bubbleRadiusBlur)
            Circle()
                .fill(Color.white)
                .frame(width: bigBubbleWidth)
                .opacity(bubbleOpacity)
                .offset(x: cardSize.width / 2,
                        y: cardSize.height / 2.8)
                .blur(radius: bubbleRadiusBlur)
            VStack(alignment: .leading) {
                Text(walletType.uppercased())
                    .modifier(CardLabel())
                Text(walletName)
                    .modifier(CardLabelValue())
                
                if wallet != nil {
                    VStack(alignment: .leading) {
                        Text(L10n.Card.Title.availableBalance.uppercased())
                            .modifier(CardLabel())
                        Text(wallet!.total.withCommas)
                            .modifier(CardLabelValue())
                    }.padding([.top, .bottom], 2)
                } else {
                    Spacer()
                        .frame(height: spacing)
                }
            }.padding([.leading], labelLeading)
        }
        .frame(width: cardSize.width, height: cardSize.height)
        .cornerRadius(cornerRadius)
        .clipped()
        .shadow(color: Color(cardColorName).opacity(0.3),
            radius: 5, x: 0, y: 15)
    }
}
