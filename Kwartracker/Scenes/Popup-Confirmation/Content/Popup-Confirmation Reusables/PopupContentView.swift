//
//  PopupContentView.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 5/3/21.
//

import SwiftUI

struct PopupContentView: View {
    @Binding var show: Bool
    let alertType: AlertType
    let bodyText: String

    var body: some View {
        if let image = alertType.image {
            Image(uiImage: image)
        }
        
        TextContentView(alertType: alertType, bodyText: bodyText)
        ButtonView(show: $show, alertType: alertType)
    }
}

private struct TextContentView: View {
    let alertType: AlertType
    let bodyText: String

    var body: some View {
        VStack {
            Text(alertType.title)
                .font(.title)
                .bold()
            
            Text(bodyText)
                .font(.headline)
                .fontWeight(.light)
        }
        .padding(.vertical)
    }
}

private struct ButtonView: View {
    @Binding var show: Bool
    let alertType: AlertType

    private let shadowRadius: CGFloat = 8
    private let shadowOffset = CGPoint(x: 6, y: 6)
    private let rectRadius: CGFloat = 17
    private let fontSize: CGFloat = 14
    private let horizontalMargin: CGFloat = 30
    
    var body: some View {
        
        Button(action: {
            show.toggle()
        }, label: {
            ZStack {
                BWNeumorphicRectangle(rectRadius: rectRadius,
                                      color: Color(Asset.Colors.teal.color),
                                      shadowRadius: shadowRadius,
                                      shadowOffset: shadowOffset)
                Text(alertType.buttonTitle)
                    .foregroundColor(.white)
                    .font(.system(size: fontSize))
            }
        })
        .padding(.horizontal, horizontalMargin)
    }
}
