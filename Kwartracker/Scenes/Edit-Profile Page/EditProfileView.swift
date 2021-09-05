//
//  EditProfileVIew.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 4/29/21.
//

import SwiftUI

struct EditProfileView: View {
    var navigationBackAction: (() -> ())

    @EnvironmentObject private var store: AppStore
    @State private var lastNameInput = ""
    @State private var firstNameInput = ""
    @State private var contactNumberInput = ""
    @State private var birthDateInput = ""
    @State private var addressInput = ""

    private let fieldSideMargin: CGFloat = 25
    private let fontSize: CGFloat = 12
    private let topMargin: CGFloat = 50

    var body: some View {
        ZStack {
            NavigationBarLayout(header: {
                NavigationBarView(title: L10n.EditProfilePage.navigationTitle) {
                    Button(action: navigationBackAction) {
                        Image(uiImage: Asset.Images.arrowLeftIconWhite.image)
                            .frame(width: 10, height: 10)
                    }
                    .buttonStyle(
                        CircleButtonStyle(buttonColor: Asset.Colors.teal.color)
                    )
                } rightBarViewContent: {
                    Button(action: saveProfileAction, label: {
                        Text(L10n.EditProfilePage.NavigationButtonItem.save)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    })
                    .frame(width: 40, alignment: .center)
                }
            }, body: {
                VStack(alignment: .leading) {
                    profileImageView
                    inputFields
                    Spacer()
                }
                .padding(.horizontal, fieldSideMargin)
                .onAppear(perform: setUserProfileInput)
            })

            alertView
        }
        .navigationBarHidden(true)
    }

    private func saveProfileAction() {
        guard let currentUser = UserDefaults.standard.retrieveUserProfile() else { return }
        let userProfile = UserProfile(id: currentUser.id,
                                      email: currentUser.email,
                                      firstName: firstNameInput,
                                      middleName: currentUser.middleName,
                                      lastName: lastNameInput,
                                      age: currentUser.age,
                                      gender: currentUser.gender)
        store.send(.editProfile(action: .submit(input: userProfile)))
    }

    private var profileImageView: some View {
        Button(action: {}, label: {
            VStack {
                ProfilePictureView()

                Text(L10n.EditProfilePage.Button.changePhoto)
                    .font(.system(size: fontSize))
                    .foregroundColor(Color(Asset.Colors.spindleGrey.color))
            }
        })
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(.bottom)
        .padding(.top, topMargin)
    }

    private var inputFields: some View {
        Group {
            UserField(fieldType: .lastName, textValue: $lastNameInput)
            UserField(fieldType: .firstName, textValue: $firstNameInput)
            UserField(fieldType: .contactNumber, textValue: $contactNumberInput)
            UserField(fieldType: .birthDate, textValue: $birthDateInput)
            UserField(fieldType: .address, textValue: $addressInput)
        }
    }

    private var alertView: some View {
        Group {
            if let errorMessage = store.state.editProfileState.errorMessage,
               !errorMessage.isEmpty {
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
        store.send(.editProfile(action: .clearErrorMessage))
    }

    private func setUserProfileInput() {
        guard let profile = UserDefaults.standard.retrieveUserProfile(),
              profile.id > 0 else { return }
        lastNameInput = profile.lastName
        firstNameInput = profile.firstName
    }
}

struct EditProfileVIew_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(navigationBackAction: {})
    }
}
