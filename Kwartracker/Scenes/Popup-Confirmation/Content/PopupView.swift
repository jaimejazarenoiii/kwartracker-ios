//
//  PopupView.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 5/3/21.
//

import SwiftUI

struct PopupView: View {
    @Binding var show: Bool
    let alertType: AlertType
    let bodyText: String
    
    var body: some View {
        VStack {
            PopupContentView(show: $show, alertType: alertType, bodyText: bodyText)
        }
        .animation(.spring())
        .background(popupBackground())
    }
}

private extension View {
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
            .frame(height: UIScreen.main.bounds.height / 2.5)
    }
}
