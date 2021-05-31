//
//  EditButtonView.swift
//  Kwartracker
//
//  Created by John Ellie Go on 5/28/21.
//

import SwiftUI

struct EditButtonView: View {
    private let buttonSize: CGFloat = 15
    private let buttonPadding: CGFloat = 13

    var body: some View {
        HStack {
            Button(action: {}, label: {
                Image(uiImage: Asset.Images.editIcon.image)
                    .resizable()
                    .frame(width: buttonSize, height: buttonSize, alignment: .center)
            }).buttonStyle(CircleButtonStyle(buttonColor: Asset.Colors.solitudeGrey.color,
                                             padding: buttonPadding))
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
        .padding([.top, .horizontal])
    }
}

struct EditButtonView_Previews: PreviewProvider {
    static var previews: some View {
        EditButtonView()
            .previewLayout(.sizeThatFits)
    }
}
