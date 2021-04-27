//
//  SignUpFooterView.swift
//  Kwartracker
//
//  Created by Veverly Mae Ricaza Veverly on 4/15/21.
//

import SwiftUI

struct SignUpFooterView: View {
    @State var showingSignIn = false
    
    var body: some View {
        VStack {
            Divider()
            HStack {
                Text(L10n.Label.Already.HaveAn.account)
                    .font(.footnote)
                    .foregroundColor(Color(Asset.Colors.nightRider.color))
                Button(action: {
                    self.showingSignIn.toggle()
                }) {
                    Text(L10n.ButtonLabelSign.in)
                        .font(.footnote)
                        .foregroundColor(Color(Asset.Colors.teal.color))
                        .underline()
                }.fullScreenCover(isPresented: $showingSignIn) {
                    SignInView()
                }
            }
            .padding([.top, .bottom], 30)
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
