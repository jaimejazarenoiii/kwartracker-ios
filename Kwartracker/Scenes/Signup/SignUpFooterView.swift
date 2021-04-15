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
            HStack {
                Text("Already have an account?")
                    .font(.footnote)
                    .foregroundColor(Color(Asset.Colors.nightRider.color))
                    .underline()
                Text("Sign in")
                    .font(.footnote)
                    .foregroundColor(Color("Teal"))
                    .underline()
            }.padding([.top], 80)
        }
    }
}

struct SignUpFooterView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpFooterView()
            .previewLayout(.sizeThatFits)
    }
}
