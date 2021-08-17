//
//  EditCategoryView.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 6/1/21.
//

import SwiftUI

struct EditCategoryView: View {
    @State var categoryName = L10n.CategoryDetailPage.navigationTitle
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        SkeletalView(header: {
            EditCategoryHeaderView(title: $categoryName, presentationMode: presentationMode)
                .padding(.top, 10)
        }, body: {
            EditCategoryBodyView()
        })
        .navigationBarHidden(true)
    }
}

struct EditCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        EditCategoryView()
    }
}

private struct EditCategoryHeaderView: View {
    @Binding var title: String
    @Binding var presentationMode: PresentationMode
    @State private var isAddCategoryLinkActive: Bool = false
    private let imageSize: CGSize = CGSize(width: 10, height: 10)
    private let backButtonSize: CGFloat = 40
    private let colorOpacity: Double = 0.3

    var body: some View {
        NavigationBarView(title: title) {
            Button(action: {
                $presentationMode.wrappedValue.dismiss()
            }) {
                Image(uiImage: Asset.Images.arrowLeftIconWhite.image)
                    .frame(width: imageSize.width, height: imageSize.height)
            }
            .buttonStyle(CircleButtonStyle(buttonColor: Asset.Colors.teal.color))
        } rightBarViewContent: {
            NavigationLink(
                destination: EditCategoryView(),
                isActive: $isAddCategoryLinkActive
            ) {
                Button(action: {}, label: {
                    Text(L10n.EditProfilePage.NavigationButtonItem.save)
                        .fontWeight(.bold)
                        .foregroundColor(.white).opacity(colorOpacity)
                })
                .frame(width: backButtonSize, alignment: .center)
            }
        }
    }
}
