//
//  SwiftUIView.swift
//  Kwartracker
//
//  Created by John Ellie Go on 4/14/21.
//

import SwiftUI

struct SignInContentView: View {
    @State private var email: String = ""
    @State private var password: String = ""
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
            UserField(fieldType: .email, textValue: $email)
            UserField(fieldType: .password, textValue: $password)
        }
    }
    
    private var SNSActions: some View {
        Group {
            SNSButton(actionHandler: {}, actionLabel: .signIn)
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
            
            HStack {
                Spacer()
                
                Text(L10n.SignInPage.Label.noAccountYet)
                    .font(.footnote)
                    .foregroundColor(Color(Asset.Colors.nightRider.color))
                Button(action: {
                    self.showingSignUp.toggle()
                }) {
                    Text(L10n.SignInPage.Button.signUp)
                        .font(.footnote)
                        .foregroundColor(Color(Asset.Colors.teal.color))
                        .underline()
                }.fullScreenCover(isPresented: $showingSignUp) {
                    SignUpView()
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
}

struct SignInContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignInContentView()
            .background(Color(Asset.Colors.solitudeGrey.color))
            .previewLayout(.sizeThatFits)
    }
}
