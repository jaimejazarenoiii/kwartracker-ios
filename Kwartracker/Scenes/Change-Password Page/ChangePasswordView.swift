//
//  ChangePasswordView.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 4/15/21.
//

import SwiftUI

struct ChangePasswordView: View {
    var navigationBackAction: (() -> ())

    @State private var inputPassword = ""
    @State private var inputConfirmPassword = ""
    @EnvironmentObject private var store: AppStore

    var body: some View {
        ZStack {
            SkeletalView(header: {
                header
            }, body: {
                VStack(alignment: .leading, spacing: 30) {
                    Spacer().frame(height: 30)

                    SecureTextFieldForm(label: L10n.ChangePasswordPage.NewPassword.label,
                                        placeholder: L10n.ChangePasswordPage.NewPassword.placeholder,
                                        inputValue: $inputPassword)

                    SecureTextFieldForm(label: L10n.ChangePasswordPage.ConfirmNewPassword.label,
                                        placeholder: L10n.ChangePasswordPage.ConfirmNewPassword.placeholder,
                                        inputValue: $inputConfirmPassword)

                    Spacer()
                }
                .padding([.leading, .trailing], 30)
            })

            alertView
        }
        .navigationBarHidden(true)
    }

    private var saveButtonOpacity: Double {
        !inputPassword.isEmpty && !inputConfirmPassword.isEmpty ? 1 : 0.3
    }

    private var header: some View {
        NavigationBarView(
            title: L10n.ChangePasswordPage.navigationTitle,
            leftBarViewContent: {
                Button(action: navigationBackAction) {
                    Image(uiImage: Asset.Images.arrowLeftIconWhite.image)
                        .frame(width: 10, height: 10)
                }
                .buttonStyle(CircleButtonStyle(buttonColor: Asset.Colors.teal.color))
            },
            rightBarViewContent: {
                Button(action: saveAction, label: {
                    Text(L10n.ChangePasswordPage.NavigationButtonItem.save)
                        .fontWeight(.bold)
                        .foregroundColor(.white).opacity(saveButtonOpacity)
                })
                .frame(width: 40, alignment: .center)
            }
        )
    }

    private func saveAction() {
        store.send(.changePassword(action: .submit(password: inputPassword, confirmPassword: inputConfirmPassword)))
    }

    private var alertView: some View {
        Group {
            if let errorMessage = store.state.changePasswordState.errorMessage {
                ZStack {
                    BackgroundBlurView()
                        .ignoresSafeArea()
                    MainAlertView(topImage: nil,
                                  title: L10n.MainAlertView.errorTitle,
                                  message: errorMessage,
                                  okAction: alertOkAction,
                                  actionTitle: L10n.MainAlertView.okayActionTitle)
                        .padding(.horizontal)
                        .fixedSize(horizontal: false, vertical: true)
                        .background(Color.white)
                        .cornerRadius(20)
                }
            }
        }
    }

    private func alertOkAction() {
        store.send(.changePassword(action: .clearErrorMessage))
    }
}

struct ChangePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ChangePasswordView(navigationBackAction: {})
    }
}
