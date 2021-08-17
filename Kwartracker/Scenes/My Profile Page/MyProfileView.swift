//
//  MyProfileView.swift
//  Kwartracker
//
//  Created by John Ellie Go on 5/28/21.
//

import SwiftUI

struct MyProfileView: View {
    var navigationBackAction: (() -> Void)
    var body: some View {
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
            MyProfileContentView()
        })

    }
}

struct MyProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MyProfileView(navigationBackAction: {})
    }
}
