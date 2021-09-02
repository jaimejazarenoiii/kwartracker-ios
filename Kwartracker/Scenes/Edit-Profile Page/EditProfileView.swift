//
//  EditProfileVIew.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 4/29/21.
//

import SwiftUI

struct EditProfileView: View {
    var navigationBackAction: (() -> ())
    var body: some View {
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
            EditProfileContentView()
        })
        .navigationBarHidden(true)
    }

    private func saveProfileAction() {
    }
}

struct EditProfileVIew_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(navigationBackAction: {})
    }
}
