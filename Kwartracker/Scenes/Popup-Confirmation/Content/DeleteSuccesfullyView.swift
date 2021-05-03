//
//  DeleteSuccesfullyView.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 5/3/21.
//

import SwiftUI

struct DeleteSuccesfullyView: View {
    @Binding var showAlert: Bool
    private let rectangleSize: CGFloat = 315

    var body: some View {
        ZStack {
            PopupContentView(
                showAlert: $showAlert,
                bodyText: L10n.AlertSheet.Body.itHasBeenSuccessfullyDeleted,
                button: .delete,
                alertType: .delete
            )
        }
        .frame(width: rectangleSize, height: rectangleSize, alignment: .center)
    }
}
