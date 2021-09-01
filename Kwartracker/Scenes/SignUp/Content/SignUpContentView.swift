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
    private let sideMargin: CGFloat = 30
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                Text(L10n.SignUpPage.Title.createAccount).foregroundColor(Color(Asset.Colors.nightRider.color))
                    .font(.system(size: titleFontSize))
                    .fontWeight(.medium)
                    .fixedSize(horizontal: false, vertical: true)

                Group {
                    TextFieldForm(
                        label: L10n.SignInPage.Label.email,
                        placeholder: L10n.SignInPage.Field.enterEmailAddress,
                        inputValue: $email
                    )

                    SecureTextFieldForm(label: L10n.SignInPage.Label.password,
                                        placeholder: L10n.SignInPage.Field.enterPassword,
                                        inputValue: $password)
                }
                .padding(.top, 20)
                
                Group {
                    Button(action: {
                        let info = UserAuthInfo(email: email, password: password)
                        store.send(.authView(action: .create(user: info)))
                    }) {
                        HStack {
                            Spacer()
                            Text(L10n.SignInPage.Button.signUp)
                                .foregroundColor(.white)
                            Spacer()
                        }
                    }
                    .buttonStyle(RoundedRectangleButtonStyle(buttonColor: Asset.Colors.teal.color,
                                                             isDisabled: snsButtonDisabled))
                    .disabled(snsButtonDisabled)
                    .padding(.top)
                    
                    HStack {
                        Spacer()
                        Text(L10n.SignUpPage.Label.or)
                            .font(.footnote)
                            .foregroundColor(Color(Asset.Colors.charcoal.color))
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
                        FootnoteButton(action: {}, text: L10n.SignUpPage.Button.signUpGuest)
                    }
                    .padding([.top, .bottom], footerNoteOffset)
                }
                
                signUpFooter
            }
            .padding(.horizontal, horizontalOffset)
            .padding(.top, topHeadMargin)
        }
    }

    private var signUpFooter: some View {
        VStack {
            Divider()
                .padding([.leading, .trailing], -sideMargin)

            HStack {
                Text(L10n.SignUpPage.Label.alreadyHaveAnAccount)
                    .font(.footnote)
                    .foregroundColor(Color(Asset.Colors.nightRider.color))
                
                Button(action: toSignInPage) {
                    Text(L10n.SignUpPage.Button.signIn)
                        .font(.footnote)
                        .foregroundColor(Color(Asset.Colors.teal.color))
                        .underline()
                }
            }
            .padding([.top, .bottom], sideMargin)
        }
    }

    private func toSignInPage() {
        store.send(.authView(action: .setAccessPage(page: .login)))
    }

    private var snsButtonDisabled: Bool {
        store.state.authState.isRequesting ||
            (!store.state.authState.isRequesting && (email.isEmpty || password.isEmpty))
    }
}

struct SignUpBodyView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpContentView()
            .background(Color(Asset.Colors.solitudeGrey.color))
            .previewLayout(.sizeThatFits)
    }
}

