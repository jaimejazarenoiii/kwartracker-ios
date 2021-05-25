//
//  TransactionHistoryView.swift
//  Kwartracker
//
//  Created by Veverly Mae Ricaza on 5/25/21.
//

import SwiftUI

struct TransactionHistoryView: View {
    
    @Binding var showSidebar: Bool
    @State var showMenu = false
    
    init(showSidebar: Binding<Bool>) {
        self._showSidebar = showSidebar
    }
    
    private var TopView: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    Button(action: {
                        withAnimation {
                            showSidebar.toggle()
                        }
                    }) {
                        if showSidebar {
                            Image(uiImage: Asset.Images.menuIcon.image)
                        }
                    }
                    SNSButton(actionHandler: {
                        withAnimation {
                            showSidebar.toggle()
                        }
                    }, actionLabel: .signInApple)
                }
                .padding(.horizontal)
                .position(x: geometry.frame(in: .global).midX, y: geometry.frame(in: .global).midY / 4)
                .zIndex(1)
            }
        }
    }

    
    var body: some View {
        VStack {
            TopView
        }
    }
}


