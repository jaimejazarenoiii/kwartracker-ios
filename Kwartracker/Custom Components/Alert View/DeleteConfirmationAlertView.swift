//
//  DeleteConfirmationAlertView.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 4/16/21.
//

import SwiftUI

struct DeleteConfirmationAlertView: View {
    @State private var showAlert = false

    var body: some View {
        ZStack {
            // Button will be remove/change
            // Once functionality is implemented
            Button(action: {
                showAlert.toggle()
            }, label: {
                Text("Button")
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            })
            .blur(radius: showAlert ? 15 : 0)
            .modifier(ConfirmationAlertView(showAlert: showAlert,
                             alignment: .center,
                             content: { DeleteConfirmationContent(showAlert: $showAlert) }))
        }
   }
}

struct DeleteConfirmationAlertView_Previews: PreviewProvider {
    static var previews: some View {
        DeleteConfirmationAlertView()
    }
}

struct DeleteConfirmationContent: View {
    @Binding var showAlert: Bool

    var body: some View {
        VStack {
            Label(
                title: {
                    Text("Confirmation")
                        .font(.system(size: 25))
                        .bold()
                },
                icon: {}
            )
            
            Label(
                title: {
                    Text("Are you sure you want to delete this?")
                        .font(.system(size: 15))
                },
                icon: {}
            ).padding(.bottom, 30)
            
        }
        .background(
            RoundedRectangle(cornerRadius: 30)
                .fill(Color(Asset.Colors.solitudeGrey.color))
                .frame(width: 315, height: 230, alignment: .center)
                .shadow(color: Color.white.opacity(1), radius: 8, x: -6, y: -6)
                .shadow(color: Color.black.opacity(0.15), radius: 8, x: 7, y: 7)
        )
    }
}

// MARK: - Confirmation Alert View
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
