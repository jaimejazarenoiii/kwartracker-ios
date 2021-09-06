//
//  PopupContentView.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 5/21/21.
//

import SwiftUI

struct PopupContentView: View {
    private let horizontalMargin: CGFloat = 30
    var body: some View {
        VStack {
            Group {
                Text(L10n.AlertSheet.Title.confirmation)
                    .bold()
                    .font(.title)
                Text(L10n.AlertSheet.Body.areYouSureYouWantToDeleteThis)
                    .font(.headline)
                    .fontWeight(.light)
                    .padding(.bottom, horizontalMargin)
            }
            HStack {
                ButtonView(actionHandler: {},
                           actionLabel: L10n.PopUpConfirmationModal.Button.delete)
                    .padding(.leading, horizontalMargin)
                ButtonView(actionHandler: {},
                           actionLabel: L10n.PopUpConfirmationModal.Button.cancel,
                           actionBtnColor: Color(Asset.Colors.spindleGrey.color))
                    .padding(.trailing, horizontalMargin)
            }
        }
    }
}

struct PopupContentView_Previews: PreviewProvider {
    static var previews: some View {
        PopupContentView()
    }
}
