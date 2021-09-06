//
//  EditCategoryView.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 6/1/21.
//

import SwiftUI

struct EditCategoryView: View {
    @State var categoryName = L10n.CategoryDetailPage.navigationTitle
    @State var category = ""
    @State var isParent = false
    var backAction: () -> ()
    var selectedParentCategory: CategoryGroup? = nil

    @State private var showCategoryOptions = false
    @State private var selectedCategoryGroup: CategoryGroup? = nil
    @State private var selectedCategoryGroupId: String? = nil
    @EnvironmentObject private var store: AppStore

    private let imageSize: CGSize = CGSize(width: 10, height: 10)
    private let backButtonSize: CGFloat = 40
    private let colorOpacity: Double = 0.3
    private let cornerRadius: CGFloat = 30
    private let rectangleSize: CGFloat = 100
    private let textOpacity: Double = 0.5
    private var categoryGroups: [CategoryGroup] {
        store.state.categoryState.categoryGroups.map { group -> CategoryGroup in
            var groupOnly = group
            groupOnly.categories = []
            return groupOnly
        }
    }
    private var categoryGroupOptions: [OptionItem] {
        categoryGroups.map { OptionItem(description: $0.title, value: "\($0.id)") }
    }


    var body: some View {
        ZStack {
            SkeletalView(header: {
                header.padding(.top, 10)
            }, body: {
                form
            })

            Group {
                if showCategoryOptions {
                    OptionView(
                        presented: $showCategoryOptions,
                        selectedItem: $selectedCategoryGroupId,
                        options: categoryGroupOptions
                    )
                    .background(BackgroundBlurView())
                    .ignoresSafeArea()
                    .transition(.opacity)
                    .animation(.easeIn)
                }
            }
        }
        .navigationBarHidden(true)
    }

    private var header: some View {
        NavigationBarView(title: categoryName) {
            Button(action: backAction) {
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

    private var form: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                if !isParent {
                    TopRightButtonView(image: Asset.Images.trashIcon.image, btnAction: {})
                }

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
                    Toggle("", isOn: $isParent)
                        .toggleStyle(CustomToggle(onText: L10n.EditCategoryPage.ContentText.toggleOn,
                                                  offText: L10n.EditCategoryPage.ContentText.toggleOff))
                }.padding()


                VStack(alignment: .leading) {
                    Text(L10n.EditCategoryPage.ContentText.selectParentCategory)
                        .font(.footnote)
                        .foregroundColor(isParent ?
                                            Color(Asset.Colors.spindleGrey.color).opacity(textOpacity) :
                                            Color(Asset.Colors.spindleGrey.color))

                    if !isParent {
                        SelectableFieldForm(
                            defaultSelectionType: .category,
                            label: "Select parent category",
                            selectLabel: selectedParentCategory == nil
                                ? "Parent category name" : (selectedParentCategory?.title ?? ""),
                            showOptions: $showCategoryOptions,
                            transactionSelection: .constant(.category)
                        )
                        .padding(.top, 10)
                    }
                }.padding()
            }.padding()
        }
    }
}
