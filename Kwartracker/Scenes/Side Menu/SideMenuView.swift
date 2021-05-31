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
        UITableView.appearance().separatorStyle = .none
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
                    }, sideMenu: item)
                }
                .listRowInsets(EdgeInsets(top: 3, leading: 0, bottom: 3, trailing: 0))
            }
            .listStyle(SidebarListStyle())
            
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
    @State var didTap: Bool = false
    let height: CGFloat = 60
    
    var body: some View {
        Button(action: {
            if didTap {
                didTap = false
            } else {
                didTap = true
            }
        }) {
            HStack {
                Image(uiImage: sideMenu.image)
                    .frame(width: 16, height: 14, alignment: .leading)
                    .padding(.leading, 10)
                Text(sideMenu.text)
                    .font(.system(size: 16))
                    .foregroundColor(didTap ? Color(Asset.Colors.teal.color) : .white)
                Spacer()
            }
        }.buttonStyle(PrimaryButtonStyle(didPressed: didTap))
    }
}

struct PrimaryButtonStyle: ButtonStyle {
    let height: CGFloat = 60
    @State var didPressed: Bool = false
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.system(size: 16))
            .frame(maxWidth: .infinity, minHeight: height, maxHeight: height)
            .background(didPressed ? .white : Color(Asset.Colors.teal.color))
            .cornerRadius(10)
    }
}
