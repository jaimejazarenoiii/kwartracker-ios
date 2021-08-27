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
            SkeletalView(header: {
                SignInHeaderView()
            }, body: {
                SignInContentView()
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
                                  title: "Error",
                                  message: errorMessage,
                                  okAction: doneAction,
                                  actionTitle: "Okay")
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
