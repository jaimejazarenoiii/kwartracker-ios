//
//  CategoryBodyView.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 5/27/21.
//

import SwiftUI

struct CategoryBodyView: View {
    @EnvironmentObject private var store: AppStore
    @State var search = ""
    
    private let shadowRadius: CGFloat = 8
    private let shadowOffset = CGPoint(x: 6, y: 6)
    private let rectRadius: CGFloat = 17
    private let searchButtonSize: CGFloat = 20
    private let bottomMargin: CGFloat = 8
    private let bodyMargin: CGFloat = 30

    let categories = Category.dummyData
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ZStack {
                    BWNeumorphicRectangle(rectRadius: rectRadius,
                                          color: Color(Asset.Colors.solitudeGrey.color),
                                          shadowRadius: shadowRadius,
                                          shadowOffset: shadowOffset)
        
                    HStack {
                        let searchBinding = Binding<String>(
                            get: { search },
                            set: {
                                search = $0
                                store.send(.categoryView(action: .categorySearch(term: search)))
                            }
                        )
                        TextField(
                            L10n.CategoryPage.searchItemPlaceholder,
                            text: searchBinding,
                            onEditingChanged: { _ in },
                            onCommit: { store.send(.categoryView(action: .commitCategorySearch)) }
                        )
                        .modifier(PlaceholderStyle(showPlaceHolder: search.isEmpty,
                                                   placeholder: L10n.CategoryPage.searchItemPlaceholder))
                        Image(uiImage: Asset.Images.searchIcon.image)
                            .resizable()
                            .frame(width: searchButtonSize, height: searchButtonSize, alignment: .center)
                    }.padding()
                }.padding(.bottom)
                
                ForEach(categories) { category in
                    CategoryListView(title: category.title, subCategory: category.childCategories)
                }.padding(.bottom, bottomMargin)
                Spacer()
            }.padding(.all, bodyMargin)
        }
    }
}

struct CategoryBodyView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryBodyView()
    }
}
