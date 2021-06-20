//
//  MessageView.swift
//  Kwartracker
//
//  Created by Veverly Mae Ricaza Veverly on 4/27/21.
//

import SwiftUI

struct MessageView: View {
    
    let state: DialogStatus
    
    var body: some View {
        VStack {
            Image(uiImage: state.image)
            Text(state.title).foregroundColor(Color(Asset.Colors.nightRider.color))
                .font(.system(size: 20))
                .fontWeight(.medium)
                .frame(width: 200, height: 30, alignment: .center)
                .fixedSize(horizontal: false, vertical: true)
            Text(state.message).foregroundColor(Color(Asset.Colors.spindleGrey.color))
                .frame(width: 220, height: 30, alignment: .center)
                .font(.system(size: 10))
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}
