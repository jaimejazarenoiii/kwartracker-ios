//
//  SwiftUIView.swift
//  Kwartracker
//
//  Created by John Ellie Go on 4/14/21.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image(Asset.Images.headerLogoIcon.name)
                Spacer()
            }
            .padding(.leading, 40)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
            .background(Color(Asset.Colors.teal.color))
            .previewLayout(.sizeThatFits)
    }
}
