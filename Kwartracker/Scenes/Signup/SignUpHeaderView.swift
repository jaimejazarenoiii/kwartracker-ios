//
//  SignUpHeaderView.swift
//  Kwartracker
//
//  Created by Veverly Mae Ricaza Veverly on 4/15/21.
//

import SwiftUI

struct SignUpHeaderView: View {
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image(Asset.Images.headerLogoIcon.name)
                Spacer()
            }
            .padding(.leading, 50)
        }
    }
}

struct SignUpHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpHeaderView()
            .background(Color("Teal"))
            .previewLayout(.sizeThatFits)
    }
}
