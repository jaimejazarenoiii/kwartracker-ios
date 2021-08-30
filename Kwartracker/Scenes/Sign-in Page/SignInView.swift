//
//  SignInView.swift
//  Kwartracker
//
//  Created by John Ellie Go on 4/14/21.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject private var store: AppStore

    var body: some View {
        ZStack {
            AccessPageLayout(header: {
                SignInHeaderView()
            }) {
                SignInContentView()
            }
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

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
