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
                                      color: Color(Asset.Colors.blueberry.color),
                                      shadowRadius: shadowRadius,
                                      shadowOffset: shadowOffset)
                
                HStack {
                    Text(actionLabel.text)
                        .foregroundColor(.white)
                        .font(.system(size: fontSize))
                }
            }
        })
    }
    
    enum Action {
        case success
        case delete
        case cancel
        case exit
        
        var text: String {
            switch self {
            case .success:
                return L10n.ButtonLabel.success
            case .delete:
                return L10n.ButtonLabel.delete
            case .cancel:
                return L10n.ButtonLabel.cancel
            case .exit:
                return L10n.ButtonLabel.exit
            }
        }
    }
}
