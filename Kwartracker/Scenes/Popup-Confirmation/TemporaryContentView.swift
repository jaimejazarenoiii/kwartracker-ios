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
               .zIndex(deleteButton ? 1 : 0)
               .blur(radius: deleteButton ? 15 : 0)
               .modifier(PopupView(showAlert: deleteButton,
                                alignment: .center,
                                direction: .top,
                                content: { DeleteSuccesfullyView(showAlert: $deleteButton) }))
            }

            ZStack {
               Button(action: {
                   successButton.toggle()
               }, label: {
                Text(L10n.AlertSheet.Title.success)
               })
               .blur(radius: successButton ? 15 : 0)
               .modifier(PopupView(showAlert: successButton,
                                   alignment: .center,
                                   direction: .bottom,
                                   content: { ChangePasswordSuccessfullyView(showAlert: $successButton) }))
            }
            .opacity(deleteButton ? 0 : 1)
        }
    }
}

struct TemporaryContentView_Previews: PreviewProvider {
    static var previews: some View {
        TemporaryContentView()
    }
}
