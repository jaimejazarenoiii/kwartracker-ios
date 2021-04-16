//
//  SignUpFooterView.swift
//  Kwartracker
//
//  Created by Veverly Mae Ricaza Veverly on 4/15/21.
//

import SwiftUI

struct SignUpFooterView: View {
    var body: some View {
        VStack {
            Divider()
            HStack {
                Text(L10n.alreadyHaveAnAccount)
                    .font(.footnote)
                    .foregroundColor(Color(Asset.Colors.nightRider.color))
                Button(action: {
                }) {
                    Text(L10n.signIn)
                        .font(.footnote)
                        .foregroundColor(Color(Asset.Colors.teal.color))
                        .underline()
                }
            }.padding([.top, .bottom], 15)
        }
    }
}

struct SignUpFooterView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpFooterView()
            .background(Color(.lightGray))
            .previewLayout(.sizeThatFits)
    }
}
