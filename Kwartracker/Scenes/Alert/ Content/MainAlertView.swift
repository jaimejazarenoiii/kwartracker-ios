//
//  MainAlertView.swift
//  Kwartracker
//
//  Created by Veverly Mae Ricaza Veverly on 4/27/21.
//

import SwiftUI

struct MainAlertView: View {
    
    let dialogStatus: DialogStatus
    
    var body: some View {
        VStack {
            MessageView(state: dialogStatus)
            ButtonView(actionHandler: {}, actionLabel: .success)
        }
    }
}

struct MainAlertView_Previews: PreviewProvider {
    static var previews: some View {
        MainAlertView(dialogStatus: .success)
    }
}
