//
//  AddCategoryView.swift
//  Kwartracker
//
//  Created by Jacob on 7/14/21.
//

import SwiftUI

struct AddCategoryView: View {
    @State var title = "Add Category"
    @State var category = ""
    @State var isParent = false
    @State var makeParent = true
    @State private var isAddCategoryLinkActive: Bool = false
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @EnvironmentObject private var store: AppStore

    var body: some View {
        SkeletalView(header: {
            AddCategoryHeaderView(
                title: $title,
                presentationMode: presentationMode,
                isAddCategoryLinkActive: $isAddCategoryLinkActive
            )
            .padding(.top, 10)
        }, body: {
            AddCategoryBodyView(
                category: $category,
                isParent: $isParent,
                makeParent: $makeParent
            )
            .environmentObject(store)
        })
        .navigationBarHidden(true)
    }
}

private struct AddCategoryHeaderView: View {
    @Binding var title: String
    @Binding var presentationMode: PresentationMode
    @Binding var isAddCategoryLinkActive: Bool

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
            Button(action: {}, label: {
                Text(L10n.EditProfilePage.NavigationButtonItem.save)
                    .fontWeight(.bold)
                    .foregroundColor(.white).opacity(colorOpacity)
            })
            .frame(width: backButtonSize, alignment: .center)
        }
    }
}

private struct AddCategoryBodyView: View {
    @Binding var category: String
    @Binding var isParent: Bool
    @Binding var makeParent: Bool
    @EnvironmentObject private var store: AppStore
    private let cornerRadius: CGFloat = 30
    private let rectangleSize: CGFloat = 100
    private let textOpacity: Double = 0.5

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {

                VStack {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .frame(width: rectangleSize, height: rectangleSize)
                        .foregroundColor(Color(Asset.Colors.teal.color))

                    Text(L10n.EditCategoryPage.ContentText.selectIcon)
                        .foregroundColor(Color(Asset.Colors.spindleGrey.color))
                        .font(.caption)
                        .fontWeight(.semibold)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)

                UserField(fieldType: .category, textValue: $category)
                    .padding(.horizontal)

                VStack(alignment: .leading) {
                    Text(L10n.EditCategoryPage.ContentText.makeParentCategory)
                        .font(.footnote)
                        .foregroundColor(Color(Asset.Colors.spindleGrey.color))
                        .padding(.top)
                    Toggle("", isOn: $makeParent)
                        .toggleStyle(
                            CustomToggle(
                                onText: L10n.EditCategoryPage.ContentText.toggleOn,
                                offText: L10n.EditCategoryPage.ContentText.toggleOff
                            )
                        )
                    Text(makeParent ? "Disable dropdown" : "Enable dropdown")
                }
                .padding()
            }
            .padding()
        }
    }
}
