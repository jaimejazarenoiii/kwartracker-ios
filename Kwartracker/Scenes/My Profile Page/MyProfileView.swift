//
//  MyProfileView.swift
//  Kwartracker
//
//  Created by John Ellie Go on 5/28/21.
//

import SwiftUI

struct MyProfileView: View {
    var navigationBackAction: (() -> Void)
    @EnvironmentObject private var store: AppStore
    @State private var isEditProfileViewLinkActive = false
    @State private var birthdate = ""
    @State private var address = ""

    private let neumorphicBoxHeight: CGFloat = 190
    private let horizontalMargin: CGFloat = 30
    private let topMargin: CGFloat = 15
    private let editHorizontalMargin: CGFloat = -15
    private let cardHeight: CGFloat = 190
    private let fontSize: CGFloat = 15
    private let verticalMargin: CGFloat = 10

    var body: some View {
        ZStack {
            NavigationBarLayout {
                NavigationBarView(title: L10n.ProfilePage.title) {
                    Button(action: navigationBackAction) {
                        Image(uiImage: Asset.Images.arrowLeftIconWhite.image)
                            .frame(width: 10, height: 10)
                    }
                    .buttonStyle(CircleButtonStyle(buttonColor: Asset.Colors.teal.color))
                } rightBarViewContent: {
                    EmptyView()
                }
            } body: {
                VStack(alignment: .leading) {
                    TopRightButtonView(image: Asset.Images.editIcon.image, btnAction: goToEditProfileView)
                        .padding(.horizontal, editHorizontalMargin)

                    profileImageView

                    profileDetails

                    Spacer()
                }
                .padding([.leading, .trailing], horizontalMargin)
                .padding(.top, topMargin)
                .onAppear(perform: fetchDetails)
            }

            NavigationLink(destination: EditProfileView(navigationBackAction: backToMyProfileAction),
                           isActive: $isEditProfileViewLinkActive) {
                EmptyView()
            }
        }
    }

    private var profileImageView: some View {
        ZStack {
            NeumorphicEffect(rectSize: CGSize(width: UIScreen.main.bounds.width - (horizontalMargin * 2),
                                              height: cardHeight))

            VStack {
                ProfilePictureView()

                Text(store.state.userProfileState.user?.fullName ?? "")
                    .font(.system(size: fontSize))
                    .padding(.top)
            }
        }
        .frame(height: cardHeight)
        .padding(.vertical, verticalMargin)
    }

    private var profileDetails: some View {
        Group {
            ProfileDetailsLabel(
                label: L10n.ProfilePage.Label.contactNumber,
                value: store.state.userProfileState.user?.email ?? ""
            )
            ProfileDetailsLabel(label: L10n.ProfilePage.Label.birthdate, value: birthdate)
            ProfileDetailsLabel(label: L10n.ProfilePage.Label.address, value: address)
        }
    }

    private func fetchDetails() {
        birthdate = L10n.ProfilePage.dummyBirthdate
        address = L10n.ProfilePage.dummyAddress
        store.send(.userProfileView(action: .fetchProfile))
    }

    private func backToMyProfileAction() {
        isEditProfileViewLinkActive = false
    }

    private func goToEditProfileView() {
        isEditProfileViewLinkActive = true
    }
}

struct MyProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MyProfileView(navigationBackAction: {})
    }
}

private struct ProfileDetailsLabel: View {
    let label: String
    let value: String
    private let fontSize: CGFloat = 15
    private let topMargin: CGFloat = 1

    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .font(.footnote)
                .foregroundColor(Color(Asset.Colors.spindleGrey.color))
                .padding(.top)

            Text(value)
                .font(.system(size: fontSize))
                .padding(.top, topMargin)
        }
    }
}
