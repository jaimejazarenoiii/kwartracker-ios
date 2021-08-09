//
//  CategoryDetailView.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 5/31/21.
//

import SwiftUI

struct CategoryDetailView: View {
    var categoryGroup: CategoryGroup
    var category: Category?
    var backAction: (() -> Void)

    var body: some View {
        SkeletalView(header: {
            NavigationBarView(
                title: categoryName) {
                Button(action: backAction, label: {
                    Image(uiImage: Asset.Images.arrowLeftIconWhite.image)
                        .frame(width: 10, height: 10)
                })
                .buttonStyle(
                    CircleButtonStyle(buttonColor: Asset.Colors.teal.color)
                )
            } rightBarViewContent: {
                EmptyView()
            }
        }, body: {
            VStack(alignment: .leading) {
                TopRightButtonView(image: Asset.Images.editIcon.image)
                    .padding(.top, 10)

                CategoryCardView(categoryName: categoryName)
                    .frame(height: 200)
                    .padding(.top, 10)

                if isChild {
                    ParentCategoryDetailView(categoryGroup: categoryGroup)
                        .padding(.top, 20)
                }

                Spacer()
            }
            .padding([.leading, .trailing], 20)
        })
        .navigationBarHidden(true)
    }

    private var isChild: Bool {
        category != nil
    }

    private var categoryName: String {
        guard let category = category else {
            return categoryGroup.title
        }
        return category.title
    }
}

private struct CategoryCardView: View {
    let categoryName: String
    private let cornerRadius: CGFloat = 30
    private let marginBottom: CGFloat = 30
    private let rectangleSize: CGFloat = 100
    private let cardSize = CGSize(width: 320, height: 190)

    var body: some View {
        ZStack {
            NeumorphicEffect(rectSize: cardSize)

            VStack {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .frame(width: rectangleSize, height: rectangleSize)
                    .foregroundColor(Color(Asset.Colors.teal.color))

                Text(categoryName)
                    .foregroundColor(.black)
                    .font(.title3)
            }
        }
        .padding(.top)
        .padding(.bottom, marginBottom)
    }
}

private struct ParentCategoryDetailView: View {
    var categoryGroup: CategoryGroup

    private let fontSize: CGFloat = 15
    private let bottomMargin: CGFloat = 8

    var body: some View {
        VStack(alignment: .leading) {
            TextGroupView(text: L10n.CategoryDetailPage.categoryParent,
                      fontSize: fontSize,
                      bottomMargin: bottomMargin,
                      fontColor: Color(Asset.Colors.spindleGrey.color))
            TextGroupView(text: categoryGroup.title,
                      fontColor: Color(Asset.Colors.nightRider.color))
        }.padding(.horizontal)
    }
}
