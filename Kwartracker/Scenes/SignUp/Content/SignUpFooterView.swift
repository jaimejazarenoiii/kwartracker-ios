//
//  SignUpFooterView.swift
//  Kwartracker
//
//  Created by Veverly Mae Ricaza Veverly on 4/15/21.
//

import SwiftUI

struct SignUpFooterView: View {
    @State var showingSignIn = false
    
    private let sideMargin: CGFloat = 30
    
    var body: some View {
        VStack {
            Divider()
                .padding([.leading, .trailing], -sideMargin)
            
            HStack {
                Text(L10n.SignUpPage.Label.alreadyHaveAnAccount)
                    .font(.footnote)
                    .foregroundColor(Color(Asset.Colors.nightRider.color))
                Button(action: {
                    self.showingSignIn.toggle()
                }) {
                    Text(L10n.SignUpPage.Button.signIn)
                        .font(.footnote)
                        .foregroundColor(Color(Asset.Colors.teal.color))
                        .underline()
                }.fullScreenCover(isPresented: $showingSignIn) {
                    SignInView()
                }
            }
            .padding([.top, .bottom], sideMargin)
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
