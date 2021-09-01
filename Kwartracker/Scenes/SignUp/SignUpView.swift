//
//  SignUpView.swift
//  Kwartracker
//
//  Created by Veverly Mae Ricaza Veverly on 4/27/21.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject private var store: AppStore

    var body: some View {
        ZStack {
            SkeletalView(header: {
                SignInHeaderView()
            }, body: {
                SignUpContentView()
            })

            alertView
        }
    }

    private var alertView: some View {
        Group {
            if let errorMessage = store.state.authState.errorMessage, !errorMessage.isEmpty {
                ZStack {
                    BackgroundBlurView()
                        .ignoresSafeArea()
                    MainAlertView(topImage: nil,
                                  title: L10n.MainAlertView.errorTitle,
                                  message: errorMessage,
                                  okAction: doneAction,
                                  actionTitle: L10n.MainAlertView.okayActionTitle)
                        .padding(.horizontal)
                        .fixedSize(horizontal: false, vertical: true)
                        .background(Color.white)
                        .cornerRadius(20)
                }
            }
        }
    }

    private func doneAction() {
        store.send(.authView(action: .setErrorMessage(message: nil)))
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
