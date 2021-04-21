//
//  SNSButton.swift
//  Kwartracker
//
//  Created by John Ellie Go on 4/16/21.
//

import SwiftUI

struct SNSButton: View {
    let action: Action
    
    private let shadowRadius: CGFloat = 8
    private let shadowOffset = CGPoint(x: -6, y: -6)
    
    var body: some View {
        Button(action: {
            
        }, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 17)
                    .fill(action.color)
                    .frame(height: 48)
                    .shadow(color: Color.white.opacity(1), radius: shadowRadius, x: -shadowOffset.x, y: -shadowOffset.y)
                    .shadow(color: Color.black.opacity(0.15), radius: shadowRadius, x: shadowOffset.x, y: shadowOffset.x)
                
                HStack {
                    if action != Action.signIn {
                        Image(action == .signInGoogle ? Asset.Images.googleIcon.name : Asset.Images.appleIcon.name)
                            .font(.system(size: 20))
                            .foregroundColor(Color.white)
                    }
                    
                    Text(action.text)
                        .foregroundColor(.white)
                        .font(.system(size: 14))
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
