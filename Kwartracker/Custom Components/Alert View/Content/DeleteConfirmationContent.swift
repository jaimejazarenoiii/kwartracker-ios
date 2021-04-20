//
//  DeleteConfirmationContent.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 4/20/21.
//

import SwiftUI

struct DeleteConfirmationContent: View {
    @Binding var showAlert: Bool

    var body: some View {
        VStack {
            Label(
                title: {
                    Text("L10n.confirmation")
                        .font(.system(size: 25))
                        .bold()
                },
                icon: {}
            )
            
            Label(
                title: {
                    Text("L10n.Are.You.Sure.You.Want.To.Delete.this")
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
