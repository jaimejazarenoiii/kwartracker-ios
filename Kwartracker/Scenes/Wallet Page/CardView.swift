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
    // value will be passed later
    @State private var cardColorName: String = Asset.Colors.mintGreen.name
    @Binding var cardSize: CGSize
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color(cardColorName))
                .blur(radius: 1.0)
            Circle()
                .fill(Color.white)
                .frame(width: 60)
                .opacity(bubbleOpacity)
                .offset(x: 130, y: -10)
                .blur(radius: bubbleRadiusBlur)
            Circle()
                .fill(Color.white)
                .frame(width: 140)
                .opacity(bubbleOpacity)
                .offset(x: 120, y: 50)
                .blur(radius: bubbleRadiusBlur)
            VStack(alignment: .leading) {
                Text("GOAL")
                    .modifier(CardLabel())
                Text("Trip to Japan")
                    .modifier(CardLabelValue())
                
                VStack(alignment: .leading) {
                    Text("AVAILABLE BALANCE")
                        .modifier(CardLabel())
                    Text("₱ 10,000.00")
                        .modifier(CardLabelValue())
                }.padding([.top, .bottom], 2)
            }.padding([.leading], 16)
        }
        .frame(width: cardSize.width, height: cardSize.height)
        .clipped()
        .shadow(color: Color(cardColorName).opacity(0.3),
            radius: 5, x: 0, y: 15)
    }
}

struct CardLabel: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 12, weight: .medium))
            .foregroundColor(Color.white.opacity(0.5))
            .fixedSize(horizontal: false, vertical: true)
            .frame(minHeight: 15)
    }
}

struct CardLabelValue: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 21, weight: .medium))
            .foregroundColor(Color.white)
            .fixedSize(horizontal: false, vertical: true)
            .frame(minHeight: 27)
    }
}