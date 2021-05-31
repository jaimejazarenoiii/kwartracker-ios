//
//  PopupConfirmationView.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 5/21/21.
//

import SwiftUI

struct PopupConfirmationView: View {
    var body: some View {
        VStack {
            PopupContentView()
        }
        .animation(.spring())
        .background(popupBackground())
    }
}

struct PopupConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        PopupConfirmationView()
    }
}

fileprivate extension View {
    @ViewBuilder func popupBackground() -> some View {
        let shadowXaxis: CGFloat = 7
        let shadowYaxis: CGFloat = 7
        let shadowRadius: CGFloat = 8
        let cornerRadius: CGFloat = 45
        let shadowColorOpacity: Double = 0.3
        
        RoundedCornerRectangle(radius: cornerRadius, corner: .allCorners)
            .shadow(
                color: Color.white.opacity(shadowColorOpacity),
                radius: shadowRadius,
                x: -shadowXaxis,
                y: -shadowYaxis
            )
            .shadow(
                color: Color.black.opacity(shadowColorOpacity),
                radius: shadowRadius,
                x: shadowXaxis,
                y: shadowYaxis
            )
            .padding()
            .frame(height: UIScreen.main.bounds.height / 3)
    }
}
