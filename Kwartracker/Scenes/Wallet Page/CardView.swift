//
//  CardView.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 4/20/21.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color(Asset.Colors.mintGreen.name))
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
        .frame(width: 228, height: 155)
        .shadow(color: Color(Asset.Colors.mintGreen.name).opacity(0.3),
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

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
