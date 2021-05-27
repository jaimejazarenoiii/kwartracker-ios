//
//  ButtonView.swift
//  Kwartracker
//
//  Created by Veverly Mae Ricaza Veverly on 4/27/21.
//

import SwiftUI

struct ButtonView: View {
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
                                      color: actionLabel.buttonColor,
                                      shadowRadius: shadowRadius,
                                      shadowOffset: shadowOffset)
                Text(actionLabel.text)
                    .foregroundColor(.white)
                    .font(.system(size: fontSize))
                    .fontWeight(actionLabel.self == .changePassword ? .bold : .regular)
            }
        })
    }
    
    enum Action {
        case success
        case delete
        case cancel
        case exit
        case changePassword
        
        var text: String {
            switch self {
            case .success:
                return L10n.PopUpConfirmationModal.Button.success
            case .delete:
                return L10n.PopUpConfirmationModal.Button.delete
            case .cancel:
                return L10n.PopUpConfirmationModal.Button.cancel
            case .exit:
                return L10n.PopUpConfirmationModal.Button.exit
            case .changePassword:
                return L10n.ChangePasswordPage.navigationTitle
            }
        }
        
        var buttonColor: Color {
            switch self {
            case .cancel:
                return Color(Asset.Colors.spindleGrey.color)
            case .delete, .changePassword:
                return Color(Asset.Colors.teal.color)
            default:
                return Color(Asset.Colors.blueberry.color)
            }
        }
    }
}
