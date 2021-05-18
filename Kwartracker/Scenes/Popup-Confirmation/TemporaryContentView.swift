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
    
    private let contentVariables = PopupContentVariables()
    
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
               .zIndex(deleteButton ? contentVariables.show : contentVariables.hide)
               .blur(radius: deleteButton ? contentVariables.blurRadius : CGFloat(contentVariables.hide))
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
               .blur(radius: deleteButton ? contentVariables.blurRadius : CGFloat(contentVariables.hide))
               .modifier(PopupView(showAlert: successButton,
                                   alignment: .center,
                                   direction: .bottom,
                                   content: { ChangePasswordSuccessfullyView(showAlert: $successButton) }))
            }
            .opacity(deleteButton ? contentVariables.hide : contentVariables.show)
        }
    }
}

struct TemporaryContentView_Previews: PreviewProvider {
    static var previews: some View {
        TemporaryContentView()
    }
}

private struct PopupContentVariables {
    let blurRadius: CGFloat = 15
    let show: Double = 1
    let hide: Double = 0
}
