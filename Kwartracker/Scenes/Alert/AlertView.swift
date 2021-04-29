//
//  AlertView.swift
//  Kwartracker
//
//  Created by Veverly Mae Ricaza Veverly on 4/27/21.
//

import SwiftUI

struct AlertView: View {
    var body: some View {
        MainAlertView()
            .frame(width: 220, height: 240, alignment: .center)
            .padding(.horizontal)
            .fixedSize(horizontal: false, vertical: true)
            .background(Color(Asset.Colors.nightRider.color))
            .cornerRadius(20)
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView().foregroundColor(Color.clear)
    }
}
