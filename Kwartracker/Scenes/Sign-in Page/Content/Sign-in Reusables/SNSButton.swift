//
//  SNSButton.swift
//  Kwartracker
//
//  Created by John Ellie Go on 4/16/21.
//

import SwiftUI

struct SNSButton: View {
    let actionHandler: (() -> Void)
    let actionLabel: Action
    
    private let shadowRadius: CGFloat = 8
    private let shadowOffset = CGPoint(x: 6, y: 6)
    private let rectRadius: CGFloat = 17
    private let fontSize: CGFloat = 14
    
    var body: some View {
        Button(action: actionHandler, label: {
            ZStack {
                BWNeumorphicRectangle(rectRadius: rectRadius,
                                      color: actionLabel.color,
                                      shadowRadius: shadowRadius,
                                      shadowOffset: shadowOffset)
                
                HStack {
                    if actionLabel != Action.signIn {
                        Image(actionLabel == .signInGoogle ? Asset.Images.googleIcon.name : Asset.Images.appleIcon.name)
                            .foregroundColor(Color.white)
                    }
                    
                    Text(actionLabel.text)
                        .foregroundColor(.white)
                        .font(.system(size: fontSize))
                }
            }
        })
    }
    
    enum Action {
        case signIn
        case signInGoogle
        case signInApple
        
        var color: Color {
            switch self {
            case .signIn:
                return Color(Asset.Colors.teal.color)
            case .signInGoogle:
                return Color(Asset.Colors.blueberry.color)
            case .signInApple:
                return Color.black.opacity(0.9)
            }
        }
        
        var text: String {
            switch self {
            case .signIn:
                return L10n.Sign.in
            case .signInGoogle:
                return L10n.Sign.In.With.google
            case .signInApple:
                return L10n.Sign.In.With.apple
            }
        }
    }
}
