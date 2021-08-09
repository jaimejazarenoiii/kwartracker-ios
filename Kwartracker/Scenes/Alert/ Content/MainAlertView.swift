//
//  MainAlertView.swift
//  Kwartracker
//
//  Created by Veverly Mae Ricaza Veverly on 4/27/21.
//

import SwiftUI

struct MainAlertView: View {
    @State private var willMoveToNextScreen = false

    let dialogStatus: DialogStatus
    
    var body: some View {
        VStack {
            MessageView(state: dialogStatus)
            ButtonView(actionHandler: {
                willMoveToNextScreen.toggle()
            }, actionLabel: .success)
        }
        .fullScreenCover(isPresented: $willMoveToNextScreen) {
            MyProfileView(navigationBackAction: {})
        }
        .padding(.all, 20)
        .frame(width: 220, height: 240, alignment: .center)
    }
}

struct MainAlertView_Previews: PreviewProvider {
    static var previews: some View {
        MainAlertView(dialogStatus: .success)
    }
}
