//
//  BrowsePhotoField.swift
//  Kwartracker
//
//  Created by Jacob on 5/12/21.
//

import SwiftUI

struct BrowsePhotoField: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Upload photo")
                .foregroundColor(Color(Asset.Colors.spindleGrey.color))
                .font(.system(size: 15))
            Button(action: {}, label: {
                Text("Browse")
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .frame(width: 147)
            })
            .buttonStyle(RoundedRectangleButtonStyle(buttonColor: Asset.Colors.loblolly.color))
        }
    }
}
