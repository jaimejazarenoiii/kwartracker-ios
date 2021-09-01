//
//  MainAlertView.swift
//  Kwartracker
//
//  Created by Veverly Mae Ricaza Veverly on 4/27/21.
//

import SwiftUI

struct MainAlertView: View {
    let topImage: UIImage?
    let title: String
    let message: String
    let okAction: (() -> ())
    let actionTitle: String
    
    var body: some View {
        VStack {
            MessageView(topImage: topImage, title: title, message: message)
            ButtonView(actionHandler: okAction, actionLabel: actionTitle)
        }
        .padding(.all, 20)
        .frame(width: 220, height: 240, alignment: .center)
    }
}

struct MainAlertView_Previews: PreviewProvider {
    static var previews: some View {
        MainAlertView(topImage: Asset.Images.checkIcon.image,
                      title: L10n.PopUpConfirmationModal.Title.success,
                      message: L10n.PopUpConfirmationModal.Label.Message.success,
                      okAction: {},
                      actionTitle: "Okay")
    }
}
