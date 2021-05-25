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
