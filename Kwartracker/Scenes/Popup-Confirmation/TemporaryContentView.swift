//
//  TemporaryContentView.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 5/3/21.
//

import SwiftUI

struct TemporaryContentView: View {
    @State private var deleteButton = false
    @State private var successButton = false

    var body: some View {
        /*
         * Contents in this file are temporary,
         * will be deleted or change once functioanlities will be implented
         */
        
        VStack {
            ZStack {
                Button(action: {
                    deleteButton.toggle()
                }, label: {
                    Text(L10n.AlertSheet.Title.deleted)
                })
                .fullScreenCover(isPresented: $deleteButton) {
                    PopupView(show: $deleteButton,
                                  alertType: .delete,
                                  bodyText: L10n.AlertSheet.Body.itHasBeenSuccessfullyDeleted)
                }
            }

            ZStack {
                Button(action: {
                    successButton.toggle()
                }, label: {
                    Text(L10n.AlertSheet.Title.success)
                })
                .fullScreenCover(isPresented: $successButton) {
                    PopupView(show: $successButton,
                                  alertType: .success,
                                  bodyText: L10n.AlertSheet.Body.yourPasswordHasBeenChanged)
                }
            }
        }
    }
}

struct TemporaryContentView_Previews: PreviewProvider {
    static var previews: some View {
        TemporaryContentView()
    }
}
