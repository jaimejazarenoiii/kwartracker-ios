//
//  SwiftUIView.swift
//  Kwartracker
//
//  Created by John Ellie Go on 4/14/21.
//

import SwiftUI

struct SignInContentView: View {
    @EnvironmentObject private var store: AppStore
    @State private var email: String = ""
    @State private var password: String = ""
    @State var showingSignIn = false
    @State var showingSignUp = false
    
    private let headerTextFontSize: CGFloat = 40
    private let sideMargin: CGFloat = 30
    private let topHeadMargin: CGFloat = 70
    private let snsOrTopMargin: CGFloat = 5
    private let footNoteTopMargin: CGFloat = 25
    
    private var HeaderText: some View {
        Text(L10n.SignInPage.Title.welcomeBack)
            .foregroundColor(Color(Asset.Colors.nightRider.color))
            .font(.system(size: headerTextFontSize))
            .fontWeight(.medium)
            .fixedSize(horizontal: false, vertical: true)
    }
    
    private var UserFields: some View {
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
    }

    private var snsButtonDisabled: Bool {
        store.state.authState.isRequesting ||
            (!store.state.authState.isRequesting && (email.isEmpty || password.isEmpty))
    }
    
    private var SNSActions: some View {
        Group {
            Button(action: {
                let info = UserAuthInfo(email: email, password: password)
                store.send(.authView(action: .login(user: info)))
            }) {
                HStack {
                    Spacer()
                    Text(L10n.SignInPage.Button.signIn)
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
                Text(L10n.SignInPage.Label.or)
                    .font(.footnote)
                    .foregroundColor(Color(Asset.Colors.charcoal.color))
                Spacer()
            }
            .padding(.top, snsOrTopMargin)
            
            SNSButton(actionHandler: {}, actionLabel: .signInGoogle)
            
            SNSButton(actionHandler: {}, actionLabel: .signInApple)
                .padding(.top)
        }
    }
    
    private var FootNoteActions: some View {
        Group {
            HStack {
                FootnoteButton(action: {}, text: L10n.SignInPage.Button.recoverPassword)
                
                Spacer()
                
                FootnoteButton(action: {}, text: L10n.SignInPage.Button.signInGuest)
            }
            .padding([.top, .bottom], footNoteTopMargin)
        }
    }
    
    private var FooterView: some View {
        Group {
            Divider()
                .padding([.leading, .trailing], -sideMargin)
            
            HStack {
                Spacer()
                
                Text(L10n.SignInPage.Label.noAccountYet)
                    .font(.footnote)
                    .foregroundColor(Color(Asset.Colors.nightRider.color))
                
                Button(action: toSignUpPage) {
                    Text(L10n.SignInPage.Button.signUp)
                        .font(.footnote)
                        .foregroundColor(Color(Asset.Colors.teal.color))
                        .underline()
                }
                
                Spacer()
            }
            .padding([.top, .bottom], footNoteTopMargin)
        }
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                
                HeaderText
                
                UserFields
                
                SNSActions
                
                FootNoteActions
                
                FooterView
            }
            .padding([.leading, .trailing], sideMargin)
            .padding(.top, topHeadMargin)
        }
    }

    private func toSignUpPage() {
        store.send(.authView(action: .setAccessPage(page: .signUp)))
    }
}

struct SignInContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignInContentView()
            .background(Color(Asset.Colors.solitudeGrey.color))
            .previewLayout(.sizeThatFits)
    }
}
