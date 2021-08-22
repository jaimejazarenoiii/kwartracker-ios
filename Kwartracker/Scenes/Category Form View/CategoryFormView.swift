//
//  CategoryFormView.swift
//  Kwartracker
//
//  Created by Jacob on 8/17/21.
//

import SwiftUI

struct CategoryFormView: View {
    @EnvironmentObject private var store: AppStore
    @State private var title = L10n.CategoryDetailPage.navigationTitle
    @State private var categoryInput = ""
    @State private var isParentInput = false
    @State private var showCategoryOptions = false
    @State private var categoryGroup: CategoryGroup? = nil
    @State private var category: Category? = nil
    @State private var selectedCategoryGroupId: String? = nil
    private var procedure: Procedure = .add
    private var backAction: () -> ()
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
    private let imageSize: CGSize = CGSize(width: 10, height: 10)
    private let backButtonSize: CGFloat = 40
    private let colorOpacity: Double = 0.3
    private let cornerRadius: CGFloat = 30
    private let rectangleSize: CGFloat = 100
    private let textOpacity: Double = 0.5

    init(
        categoryGroup: CategoryGroup? = nil,
        category: Category? = nil,
        procedure: Procedure = .add,
        backAction: @escaping () -> ()
    ) {
        self._categoryGroup = State(initialValue: categoryGroup)
        self._category = State(initialValue: category)
        self.procedure = procedure
        self.backAction = backAction
        if procedure == .add {
            self._title = State(initialValue: "Add Category")
        } else if let category = category,
                  let categoryGroup = categoryGroup {
            self._title = State(initialValue: category.title)
            self._categoryInput = State(initialValue: category.title)
            self._isParentInput = State(initialValue: false)
            self._selectedCategoryGroupId = State(initialValue: "\(categoryGroup.id)")
        } else if let categoryGroup = categoryGroup {
            self._title = State(initialValue: categoryGroup.title)
            self._categoryInput = State(initialValue: categoryGroup.title)
            self._isParentInput = State(initialValue: true)
        }
    }

    var body: some View {
        ZStack {
            SkeletalView(header: {
                header.padding(.top, 10)
            }, body: {
                form
            })

            categoryOptionsModalView
        }
        .navigationBarHidden(true)
    }

    private var header: some View {
        NavigationBarView(title: title) {
            Button(action: backAction) {
                Image(uiImage: Asset.Images.arrowLeftIconWhite.image)
                    .frame(width: imageSize.width, height: imageSize.height)
            }
            .buttonStyle(CircleButtonStyle(buttonColor: Asset.Colors.teal.color))
        } rightBarViewContent: {
            let saveButtonOpacity = categoryInput.isEmpty ? 0.3 : 1
            Button(action: saveCategory, label: {
                Text(L10n.EditProfilePage.NavigationButtonItem.save)
                    .fontWeight(.bold)
                    .foregroundColor(.white).opacity(saveButtonOpacity)
            })
            .frame(width: backButtonSize, alignment: .center)
        }
    }

    private var form: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {

                if procedure == .edit {
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

                UserField(fieldType: .category, textValue: $categoryInput)
                    .padding(.horizontal)

                VStack(alignment: .leading) {
                    Text(L10n.EditCategoryPage.ContentText.makeParentCategory)
                        .font(.footnote)
                        .foregroundColor(Color(Asset.Colors.spindleGrey.color))
                        .padding(.top)
                    Toggle("", isOn: $isParentInput)
                        .toggleStyle(CustomToggle(onText: L10n.EditCategoryPage.ContentText.toggleOn,
                                                  offText: L10n.EditCategoryPage.ContentText.toggleOff))
                }.padding()

                let selectedCategoryGroup = getSelectedCategoryGroup()
                SelectableFieldForm(
                    defaultSelectionType: .category,
                    label: L10n.EditCategoryPage.ContentText.selectParentCategory,
                    selectLabel: selectedCategoryGroup == nil
                        ? "Parent category name" : (selectedCategoryGroup?.title ?? ""),
                    showOptions: $showCategoryOptions,
                    transactionSelection: .constant(.category)
                )
                .padding([.top, .leading, .trailing], 10)
                .disabled(isParentInput)
            }.padding()
        }
    }

    private var categoryOptionsModalView: some View {
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

    private func saveCategory() {
        if procedure == .add {
            if isParentInput {
                store.send(.category(action: .parentCategoryAddRequest(title: categoryInput)))
            } else {
                guard let groupId = Int(selectedCategoryGroupId ?? ""), groupId > 0 else { return }
                store.send(.category(action: .addCategoryRequest(title: categoryInput, categoryGroupId: groupId)))
            }
        }
    }

    private func getSelectedCategoryGroup() -> CategoryGroup? {
        guard let groupId = Int(selectedCategoryGroupId ?? "") else { return nil }
        return categoryGroups.first(where: { $0.id == groupId })
    }
}
