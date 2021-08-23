//
//  MessageView.swift
//  Kwartracker
//
//  Created by Veverly Mae Ricaza Veverly on 4/27/21.
//

import SwiftUI

struct MessageView: View {
    let topImage: UIImage
    let title: String
    let message: String
    
    var body: some View {
        VStack {
            Image(uiImage: topImage)
            Text(title).foregroundColor(Color(Asset.Colors.nightRider.color))
                .font(.system(size: 20))
                .fontWeight(.medium)
                .frame(width: 200, height: 30, alignment: .center)
                .fixedSize(horizontal: false, vertical: true)
            Text(message).foregroundColor(Color(Asset.Colors.spindleGrey.color))
                .frame(width: 220, height: 30, alignment: .center)
                .font(.system(size: 10))
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}
