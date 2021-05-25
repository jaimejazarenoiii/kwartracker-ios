//
//  ConfirmationAlertView.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 4/20/21.
//

import SwiftUI

struct ConfirmationAlertView<T: View>: ViewModifier {
    let popup: T
    let showAlert: Bool
    let alignment: Alignment
    
    init(showAlert: Bool, alignment: Alignment, @ViewBuilder content: () -> T) {
        self.showAlert = showAlert
        self.alignment = alignment
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
                    .transition(.offset(x: 0, y: geometry.belowScreenEdge))
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: alignment)
            }
        }
    }
}

private extension GeometryProxy {
    var belowScreenEdge: CGFloat {
        UIScreen.main.bounds.height - frame(in: .global).minY
    }
}
