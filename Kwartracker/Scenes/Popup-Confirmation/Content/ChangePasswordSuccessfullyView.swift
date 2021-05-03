//
//  SuccessPopupView.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 5/3/21.
//

import SwiftUI

struct ChangePasswordSuccessfullyView: View {
    @Binding var showAlert: Bool
    private let rectangleSize: CGFloat = 315

    var body: some View {
        ZStack {
            PopupContentView(
                showAlert: $showAlert,
                bodyText: L10n.AlertSheet.Body.yourPasswordHasBeenChanged,
                button: .success,
                alertType: .success
            )
        }
        .frame(width: rectangleSize, height: rectangleSize, alignment: .center)
    }
}
