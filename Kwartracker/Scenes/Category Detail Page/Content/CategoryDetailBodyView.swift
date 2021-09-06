//
//  CategoryDetailBodyView.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 5/31/21.
//

import SwiftUI

struct CategoryDetailBodyView: View {
    @State var categoryName: String = L10n.CategoryDetailPage.navigationTitle

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                TopRightButtonView(image: Asset.Images.editIcon.image, btnAction: {})
                
                CategoryCardView(categoryName: categoryName)
                
                ParentCategoryDetailView()
            }.padding()
        }
    }
}

struct CategoryDetailBodyView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetailBodyView()
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
    private let fontSize: CGFloat = 15
    private let bottomMargin: CGFloat = 8

    var body: some View {
        VStack(alignment: .leading) {
            TextGroupView(text: L10n.CategoryDetailPage.categoryParent,
                      fontSize: fontSize,
                      bottomMargin: bottomMargin,
                      fontColor: Color(Asset.Colors.spindleGrey.color))
            TextGroupView(text: L10n.CategoryDetailPage.categoryParentName,
                      fontColor: Color(Asset.Colors.nightRider.color))
        }.padding(.horizontal)
    }
}
