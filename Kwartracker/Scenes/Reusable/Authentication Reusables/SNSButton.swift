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
                    if let image = actionLabel.image {
                        Image(uiImage: image)
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
        case signUp
        case signUpGoogle
        case signUpApple

        var color: Color {
            switch self {
            case .signIn, .signUp:
                return Color(Asset.Colors.teal.color)
            case .signInGoogle, .signUpGoogle:
                return Color(Asset.Colors.blueberry.color)
            case .signInApple, .signUpApple:
                return Color.black.opacity(0.9)
            }
        }
        
        var text: String {
            switch self {
            case .signIn:
                return L10n.SignInPage.Button.signIn
            case .signInGoogle:
                return L10n.SignInPage.Button.signInGoogle
            case .signInApple:
                return L10n.SignInPage.Button.signInApple
            case .signUp:
                return L10n.SignUpPage.Button.signUp
            case .signUpGoogle:
                return L10n.SignUpPage.Button.signUpGoogle
            case .signUpApple:
                return L10n.SignUpPage.Button.signUpApple
            }
        }
        
        var image: UIImage? {
            switch self {
            case .signIn, .signUp:
                return nil
            case .signInGoogle, .signUpGoogle:
                return Asset.Images.googleIcon.image
            case .signInApple, .signUpApple:
                return Asset.Images.appleIcon.image
            }
        }
    }
}
