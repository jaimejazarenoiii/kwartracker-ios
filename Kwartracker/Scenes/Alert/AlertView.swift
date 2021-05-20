//
//  AlertView.swift
//  Kwartracker
//
//  Created by Veverly Mae Ricaza Veverly on 4/27/21.
//

import SwiftUI

struct AlertView: View {
    var body: some View {
        ZStack {
            Color.gray.opacity(0.4).edgesIgnoringSafeArea(.all)
            MainAlertView(dialogStatus: .success)
                .padding(.horizontal)
                .fixedSize(horizontal: false, vertical: true)
                .background(Color.white)
                .cornerRadius(20)
        }
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView()
    }
}
