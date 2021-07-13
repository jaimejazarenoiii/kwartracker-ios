//
//  CategoryView.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 5/27/21.
//

import SwiftUI

struct CategoryView: View {
    @EnvironmentObject private var store: AppStore
    var body: some View {
        NavigationView {
            SkeletalView(header: {
                CategoryHeaderView().padding(.top, 10)
                    .environmentObject(store)
            }, body: {
                CategoryBodyView().environmentObject(store)
            })
            .navigationBarHidden(true)
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}

private struct CategoryHeaderView: View {
    @EnvironmentObject private var store: AppStore
    @State private var isAddCategoryLinkActive: Bool = false
    private let imageSize: CGSize = CGSize(width: 10, height: 10)

    var body: some View {
        NavigationBarView(
            title: L10n.SettingsPage.NavigationItem.categories) {
            Button(action: {}) {
                Image(uiImage: Asset.Images.arrowLeftIconWhite.image)
                    .frame(width: 10, height: 10)
            }
            .buttonStyle(
                CircleButtonStyle(buttonColor: Asset.Colors.teal.color)
            )
        } rightBarViewContent: {
            NavigationLink(
                destination: EditCategoryView(categoryName: "Add Category")
                    .environmentObject(store),
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
