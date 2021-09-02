//
//  MyProfileView.swift
//  Kwartracker
//
//  Created by John Ellie Go on 5/28/21.
//

import SwiftUI

struct MyProfileView: View {
    var navigationBackAction: (() -> Void)
    @State private var isEditProfileViewLinkActive = false

    var body: some View {
        ZStack {
            SkeletalView(header: {
                NavigationBarView(
                    title: L10n.ProfilePage.title) {
                    Button(action: navigationBackAction) {
                        Image(uiImage: Asset.Images.arrowLeftIconWhite.image)
                            .frame(width: 10, height: 10)
                    }
                    .buttonStyle(
                        CircleButtonStyle(buttonColor: Asset.Colors.teal.color)
                    )
                } rightBarViewContent: {
                    EmptyView()
                }
            }, body: {
                MyProfileContentView(isEditProfileViewLinkActive: $isEditProfileViewLinkActive)
            })

            NavigationLink(destination: EditProfileView(navigationBackAction: backToMyProfileAction),
                           isActive: $isEditProfileViewLinkActive) {
                EmptyView()
            }
        }
    }

    private func backToMyProfileAction() {
        isEditProfileViewLinkActive = false
    }
}

struct MyProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MyProfileView(navigationBackAction: {})
    }
}
