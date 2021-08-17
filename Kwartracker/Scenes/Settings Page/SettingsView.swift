//
//  SettingsView.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 5/24/21.
//

import SwiftUI

struct SettingsView: View {
    var navigationBackAction: (() -> Void)
    @EnvironmentObject var store: AppStore
    @State private var categoryLinkIsActive = false
    @State private var loginSecurityLinkIsActive = false

    var body: some View {
        SkeletalView(header: {
            NavigationBarView(
                title: L10n.SettingsPage.navigationTitle) {
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
            SettingsBodyView(
                loginSecurityLinkIsActive: $loginSecurityLinkIsActive,
                categoryLinkIsActive: $categoryLinkIsActive
            )
            
            NavigationLink(destination: CategoryView(navigationBackAction: {
                categoryLinkIsActive = false
            }).environmentObject(store), isActive: $categoryLinkIsActive) {
                EmptyView()
            }
            .hidden()
        })
        .navigationBarHidden(true)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(navigationBackAction: {})
    }
}
