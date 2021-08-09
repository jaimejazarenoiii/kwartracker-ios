//
//  AddCategoryView.swift
//  Kwartracker
//
//  Created by Jacob on 7/14/21.
//

import SwiftUI

struct AddCategoryView: View {
    @State var title = "Add Category"
    @State var inputCategoryName = ""
    @State var inputIsParent = true

    @State private var isAddCategoryLinkActive: Bool = false
    @State private var showCategoryOptions = false
    @State private var selectedCategoryGroup: CategoryGroup?
    @State private var selectedCategoryGroupId: String?
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @EnvironmentObject private var store: AppStore

    private let addCategoryHeaderTop: CGFloat = 10
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
                AddCategoryHeaderView(
                    title: $title,
                    presentationMode: presentationMode,
                    isAddCategoryLinkActive: $isAddCategoryLinkActive,
                    isSaveButtonDisabled: .constant(inputCategoryName.isEmpty),
                    addCategoryAction: addCategory
                )
                .padding(.top, addCategoryHeaderTop)
            }, body: {
                AddCategoryForm(
                    inputCategoryName: $inputCategoryName,
                    makeParent: $inputIsParent,
                    showCategoryOptions: $showCategoryOptions,
                    selectedParentCategory: getSelectedCategoryGroup()
                )
            })

            Group {
                if showCategoryOptions {
                    OptionView(
                        presented: $showCategoryOptions,
                        selectedItem: $selectedCategoryGroupId,
                        options: categoryGroupOptions
                    )
                    .transition(.opacity)
                }
            }
        }
        .navigationBarHidden(true)
    }

    private func addCategory() {
        if inputIsParent {
            store.send(.category(action: .parentCategoryAddRequest(title: inputCategoryName)))
        } else {
            guard let groupId = getSelectedCategoryGroup()?.id, groupId > 0 else { return }
            store.send(.category(action: .addCategoryRequest(title: inputCategoryName, categoryGroupId: groupId)))
        }
    }

    private func getSelectedCategoryGroup() -> CategoryGroup? {
        guard let groupId = Int(selectedCategoryGroupId ?? "") else { return nil }
        return categoryGroups.first(where: { $0.id == groupId })
    }
}

private struct AddCategoryHeaderView: View {
    @Binding var title: String
    @Binding var presentationMode: PresentationMode
    @Binding var isAddCategoryLinkActive: Bool
    @Binding var isSaveButtonDisabled: Bool
    var addCategoryAction: (() -> Void)

    private let imageSize: CGSize = CGSize(width: 10, height: 10)
    private let backButtonSize: CGFloat = 40
    private let saveButtonDisabledOpacity: Double = 0.3
    private let saveButtonEnabledOpacity: Double = 1

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
            Button(action: addCategoryAction, label: {
                let colorOpacity = isSaveButtonDisabled ? saveButtonDisabledOpacity : saveButtonEnabledOpacity
                Text(L10n.EditProfilePage.NavigationButtonItem.save)
                    .fontWeight(.bold)
                    .foregroundColor(.white).opacity(colorOpacity)
            })
            .frame(width: backButtonSize, alignment: .center)
            .disabled(isSaveButtonDisabled)
        }
    }
}

private struct AddCategoryForm: View {
    @Binding var inputCategoryName: String
    @Binding var makeParent: Bool
    @Binding var showCategoryOptions: Bool
    var selectedParentCategory: CategoryGroup?

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

                UserField(fieldType: .category, textValue: $inputCategoryName)
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

                    if !makeParent {
                        SelectableFieldForm(defaultSelectionType: .category,
                                            label: "Select parent category",
                                            selectLabel: selectedParentCategory == nil ? "Parent category name" :
                                                (selectedParentCategory?.title ?? ""),
                                            showOptions: $showCategoryOptions,
                                            transactionSelection: .constant(.category))
                            .padding(.top, 10)
                    }

                }
                .padding()
            }
            .padding()
        }
    }
}
