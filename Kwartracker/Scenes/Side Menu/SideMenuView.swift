//
//  SideMenuView.swift
//  Kwartracker
//
//  Created by Veverly Mae Ricaza on 5/24/21.
//

import SwiftUI

struct SideMenuView: View {
    
    @State private var selectedItemId: String = ""
    @State private var sideMenu: SideMenu?
        
    init() {
        UITableView.appearance().backgroundColor = Asset.Colors.teal.color
    }

    var body: some View {
        VStack(alignment: .leading) {
            ProfileView()
                    .padding([.leading, .top], 20)
            List {
                ForEach(SideMenu.sideMenuList) { item in
                    ListButtonView(actionHandler: {
                        selectedItemId = item.id
                    }, sideMenu: item, didTap: false)
                }.background(Color(.clear))
            }.listStyle(SidebarListStyle())
            Button(action: {}) {
                HStack {
                    Image(uiImage: Asset.Images.powerIcon.image)
                        .resizable()
                        .frame(width: 15, height: 15, alignment: .center)
                    Text(L10n.SideMenu.Label.logout)
                        .font(.system(size: 16))
                        .foregroundColor(Color(.white))
                }
            }
            .padding([.leading, .top], 25)
        }
        .padding([.top, .bottom], 30)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(Asset.Colors.teal.color))
        .edgesIgnoringSafeArea(.all)
    }
}

struct ListButtonView: View {
    let actionHandler: (() -> Void)
    var sideMenu: SideMenu
    @State var didTap: Bool
    
    var body: some View {
        Button(action: {
            self.didTap = true
        }) {
            HStack {
                Image(uiImage: sideMenu.image)
                    .resizable()
                    .frame(width: 16, height: 14, alignment: .center)
                Text(sideMenu.text)
                    .font(.system(size: 16))
                    .foregroundColor(.white)
            }
            .padding([.top, .bottom], 10)
        }
    }
}

