//
//  SignInFooterView.swift
//  Kwartracker
//
//  Created by John Ellie Go on 5/6/21.
//

import SwiftUI

struct SignInFooterView: View {
    private let footNoteTopMargin: CGFloat = 25
    
    var body: some View {
        VStack {
            Divider()
            
            HStack {
                Spacer()
                
                Text(L10n.SignInPage.Label.noAccountYet)
                    .font(.footnote)
                    .foregroundColor(Color(Asset.Colors.nightRider.color))
                
                FootnoteButton(action: {}, text: L10n.SignInPage.Button.signUp,
                               fontWeight: .bold, color: Color(Asset.Colors.teal.color))
                
                Spacer()
            }
            .padding([.top, .bottom], footNoteTopMargin)
        }
    }
}

struct SignInFooterView_Previews: PreviewProvider {
    static var previews: some View {
        SignInFooterView()
            .previewLayout(.sizeThatFits)
    }
}
