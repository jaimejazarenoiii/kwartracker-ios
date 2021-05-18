//
//  KTextfield.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 5/18/21.
//

import SwiftUI

struct KTextfield: View {
    private let shadowRadius: CGFloat = 8
    private let shadowOffset = CGPoint(x: 6, y: 6)
    private let rectRadius: CGFloat = 17
    private let fieldHeight: CGFloat = 48
    private let fieldSideMargin: CGFloat = 20
    @Binding var textValue: String
    var textLabel: String
    var textPlaceHolder: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(textLabel)
                .font(.footnote)
                .foregroundColor(Color(Asset.Colors.spindleGrey.color))
                .padding(.top)
            
            ZStack {
                BWNeumorphicRectangle(rectRadius: rectRadius,
                                      color: Color(Asset.Colors.solitudeGrey.color),
                                      shadowRadius: shadowRadius,
                                      shadowOffset: shadowOffset)
                
                TextField("", text: $textValue)
                    .modifier(PlaceholderStyle(showPlaceHolder: textValue.isEmpty,
                                               placeholder: textPlaceHolder))
                    .background(Color(Asset.Colors.solitudeGrey.color))
                    .frame(height: fieldHeight, alignment: .center)
                    .cornerRadius(rectRadius)
                    .padding([.leading, .trailing], fieldSideMargin)
            }
        }
        .padding([.trailing, .leading],
                 UIScreen.main.bounds.width * 0.07)
    }
}

struct KTextfield_Previews: PreviewProvider {
    static var previews: some View {
        KTextfield(textValue: Binding.constant(""),
                   textLabel: L10n.Wallet.Label.walletName,
                   textPlaceHolder: L10n.Wallet.Placeholder.enterWalletName)
    }
}
