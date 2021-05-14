//
//  CardTargetView.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 5/14/21.
//

import SwiftUI

struct CardTargetView: View {
    private let shadowRadius: CGFloat = 8
    private let shadowOffset = CGPoint(x: 6, y: 6)
    private let rectRadius: CGFloat = 20
    private let margin: CGFloat = 30
    private let frameWidth: CGFloat = UIScreen.main.bounds.width * 0.8
    private let baseFrame: CGSize = CGSize(width: 315, height: 90)
    private let progressBarSize: CGSize = CGSize(width: 275, height: 12)
    private let separatorSize: CGSize = CGSize(width: 1, height: 50)
    
    var body: some View {
        ZStack(alignment: .leading) {
            NeumorphicEffect(rectSize: CGSize(width: frameWidth, height: self.setHeightRatio(width: frameWidth,
                                               baseSize: baseFrame)), cornerRadius: rectRadius)
            VStack {
                HStack {
                    TargetViewLabel(bottomLabel: L10n.Wallet.Target.toTargetAmount)
                    Rectangle()
                        .fill(Color(Asset.Colors.iron.color))
                        .frame(width: separatorSize.width,
                               height: separatorSize.height)
                        .padding([.leading, .trailing], margin)
                    TargetViewLabel(bottomLabel: L10n.Wallet.Target.toTargetDate)
                }
                
                ProgressView(rectFrame: progressBarSize)
            }
            .padding([.leading, .trailing], margin)
        }
        .frame(width: frameWidth,
               height: self.setHeightRatio(width: frameWidth, baseSize: baseFrame))
    }
}

struct WalletTargetView_Previews: PreviewProvider {
    static var previews: some View {
        CardTargetView()
    }
}
