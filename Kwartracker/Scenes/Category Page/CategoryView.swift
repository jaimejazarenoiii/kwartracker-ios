//
//  CategoryView.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 5/27/21.
//

import SwiftUI

struct CategoryView: View {
    var navigationBackAction: (() -> Void)
    @EnvironmentObject private var store: AppStore
    var body: some View {
        SkeletalView(header: {
            CategoryHeaderView(navigationBackAction: navigationBackAction)
                .padding(.top, 10)
        }, body: {
            CategoryBodyView().environmentObject(store)
        })
        .navigationBarHidden(true)
    }
}

private struct CategoryHeaderView: View {
    var navigationBackAction: (() -> Void)
    @State private var isAddCategoryLinkActive: Bool = false
    private let imageSize: CGSize = CGSize(width: 10, height: 10)

    var body: some View {
        NavigationBarView(title: L10n.SettingsPage.NavigationItem.categories) {
            Button(action: navigationBackAction) {
                Image(uiImage: Asset.Images.arrowLeftIconWhite.image)
                    .frame(width: 10, height: 10)
            }
            .buttonStyle(CircleButtonStyle(buttonColor: Asset.Colors.teal.color))
        } rightBarViewContent: {
            NavigationLink(
                destination: AddCategoryView(),
                isActive: $isAddCategoryLinkActive
            ) {
                Button(action: {
                    isAddCategoryLinkActive.toggle()
                }) {
                    Image(uiImage: Asset.Images.addIconTeal.image)
                        .frame(width: imageSize.width, height: imageSize.height)
                }
                .buttonStyle(CircleButtonStyle(buttonColor: .white))
            }
        }
    }
}
