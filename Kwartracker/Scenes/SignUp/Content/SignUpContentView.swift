//
//  SignUpBodyView.swift
//  Kwartracker
//
//  Created by Veverly Mae Ricaza Veverly on 4/15/21.
//

import SwiftUI

struct SignUpContentView: View {
    @EnvironmentObject private var store: AppStore
    @State var email: String = ""
    @State var password: String = ""
    
    private let horizontalOffset: CGFloat = 30
    private let topHeadMargin: CGFloat = 70
    private let titleFontSize: CGFloat = 40
    private let signInTopOffset: CGFloat = 15
    private let orSpacerTopOffset: CGFloat = 5
    private let footerNoteOffset: CGFloat = 25
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                Text(L10n.SignUpPage.Title.createAccount).foregroundColor(Color(Asset.Colors.nightRider.color))
                    .font(.system(size: titleFontSize))
                    .fontWeight(.medium)
                    .fixedSize(horizontal: false, vertical: true)
                
                UserField(fieldType: .email, textValue: $email)
                UserField(fieldType: .password, textValue: $password)
                
                Group {
                    SNSButton(actionHandler: {
                        let userInfo = UserAuthInfo(email: email, password: password)
                        store.send(.authView(action: .create(user: userInfo)))
                    }, actionLabel: .signUp)
                    .padding(.top, signInTopOffset)
                    .disabled(store.state.authState.isRequesting)
                    
                    HStack {
                        Spacer()
                        Text(L10n.SignUpPage.Label.or)
                        Spacer()
                     }
                    .padding(.top, orSpacerTopOffset)
                    
                    SNSButton(actionHandler: {}, actionLabel: .signUpGoogle)
                    SNSButton(actionHandler: {}, actionLabel: .signUpApple)
                        .padding(.top)
                }
                
                Group {
                    HStack {
                        Spacer()
                        Button(action: {
                        }) {
                            Text(L10n.SignUpPage.Button.signUpGuest)
                                .font(.footnote)
                                .foregroundColor(.secondary)
                                .underline()
                        }
                    }
                }
                .padding(.vertical, footerNoteOffset)
                
                SignUpFooterView()
            }
            .padding(.horizontal, horizontalOffset)
            .padding(.top, topHeadMargin)
        }
    }
}

struct SignUpBodyView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpContentView()
            .background(Color(Asset.Colors.solitudeGrey.color))
            .previewLayout(.sizeThatFits)
    }
}

