//
//  PopupView.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 5/3/21.
//

import SwiftUI

struct PopupView<T: View>: ViewModifier {
    let popup: T
    let showAlert: Bool
    let alignment: Alignment
    let direction: Direction

    init(showAlert: Bool, alignment: Alignment, direction: Direction, @ViewBuilder content: () -> T) {
        self.showAlert = showAlert
        self.alignment = alignment
        self.direction = direction
        popup = content()
    }

    func body(content: Content) -> some View {
        content
            .overlay(popupContent())
    }

    @ViewBuilder private func popupContent() -> some View {
        GeometryReader { geometry in
            if showAlert {
                popup
                    .animation(.spring())
                    .transition(.offset(x: 0, y: direction.offset(popupFrame: geometry.frame(in: .global))))
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: alignment)
            }
        }
    }
    
    enum Direction {
        case top, bottom

        func offset(popupFrame: CGRect) -> CGFloat {
            switch self {
            case .top:
                return -popupFrame.maxY
            case .bottom:
                return UIScreen.main.bounds.height - popupFrame.minY
            }
        }
    }
}
