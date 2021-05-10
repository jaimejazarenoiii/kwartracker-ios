//
//  SwiftUIView.swift
//  Kwartracker
//
//  Created by John Ellie Go on 4/14/21.
//

import SwiftUI

struct SignInHeaderView: View {
    private let leadingMargin: CGFloat = 40
    private let contentSpacing: CGFloat = 10
    
    var body: some View {
        VStack {
            HStack(spacing: contentSpacing) {
                Image(Asset.Images.headerLogoIcon.name)
                Spacer()
            }
            .padding(.leading, leadingMargin)
        }
    }
}

struct SignInHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SignInHeaderView()
            .background(Color(Asset.Colors.teal.color))
            .previewLayout(.sizeThatFits)
    }
}
