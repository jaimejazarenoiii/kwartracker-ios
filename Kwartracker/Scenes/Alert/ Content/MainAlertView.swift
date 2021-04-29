//
//  MainAlertView.swift
//  Kwartracker
//
//  Created by Veverly Mae Ricaza Veverly on 4/27/21.
//

import SwiftUI

struct MainAlertView: View {
    
    var body: some View {
        VStack {
            ImageView(imageType: .success)
            MessageView(messageType: .success)
            ButtonView(actionHandler: {}, actionLabel: .success)
        }
    }
}

struct MainAlertView_Previews: PreviewProvider {
    static var previews: some View {
        MainAlertView()
    }
}
