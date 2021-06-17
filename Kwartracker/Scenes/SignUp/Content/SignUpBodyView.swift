//
//  SignUpBodyView.swift
//  Kwartracker
//
//  Created by Veverly Mae Ricaza Veverly on 4/15/21.
//

import SwiftUI

struct SignUpBodyView: View {
    @StateObject private var viewModel = SignUpViewModel()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                Text(L10n.SignUpPage.Title.createAccount).foregroundColor(Color(Asset.Colors.nightRider.color))
                    .font(.system(size: 40))
                    .fontWeight(.medium)
                    .fixedSize(horizontal: false, vertical: true)
                UserField(fieldType: .email, textValue: $viewModel.email)
                UserField(fieldType: .password, textValue: $viewModel.password)
                Group {
                    SNSButton(actionHandler: {
                        viewModel.doRegisterUser()
                    }, actionLabel: .signUp).padding(.top, 15)
                    HStack {
                        Spacer()
                        Text(L10n.SignUpPage.Label.or)
                        Spacer()
                     }.padding(.top, 5)
                    SNSButton(actionHandler: {}, actionLabel: .signUpGoogle)
                    SNSButton(actionHandler: {}, actionLabel: .signUpApple)
                        .padding(.top)
                }
                .fullScreenCover(isPresented: $viewModel.isAuthenticated) {
                    AlertView()
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
                
                .padding([.leading, .top], 20)
            }
            .padding(.all, 30)
        }
    }
}

struct SignUpBodyView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpBodyView()
            .background(Color(Asset.Colors.solitudeGrey.color))
            .previewLayout(.sizeThatFits)
    }
}

