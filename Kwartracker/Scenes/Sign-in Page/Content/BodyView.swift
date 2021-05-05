//
//  SwiftUIView.swift
//  Kwartracker
//
//  Created by John Ellie Go on 4/14/21.
//

import SwiftUI

struct BodyView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State var showingSignIn = false
    
    private let headerTextFontSize: CGFloat = 45
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
            SNSButton(actionHandler: {
                self.showingSignIn.toggle()
            }, actionLabel: .signIn)
            .padding(.top)
            .fullScreenCover(isPresented: $showingSignIn) {
                AlertView()
            }
            
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
            .padding(.top, footNoteTopMargin)
            
            Divider()
                .padding([.leading, .trailing], -sideMargin)
                .padding(.top, footNoteTopMargin)
            
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
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                
                HeaderText
                
                UserFields
                
                SNSActions
                
                FootNoteActions
            }
            .padding([.leading, .trailing], sideMargin)
            .padding(.top, topHeadMargin)
        }
    }
}

struct BodyView_Previews: PreviewProvider {
    static var previews: some View {
        BodyView()
            .background(Color(Asset.Colors.solitudeGrey.color))
            .previewLayout(.sizeThatFits)
    }
}
