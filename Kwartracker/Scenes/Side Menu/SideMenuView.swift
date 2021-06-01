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
    
    let profileViewPadding: CGFloat = 20
    let listTopBottom: CGFloat = 3
    let listLeftRight: CGFloat = 0
    let frameSize: CGFloat = 15
    let fontSize: CGFloat = 16
    let logoutBtnPadding: CGFloat = 25
    let bodyPadding: CGFloat = 30
    
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().backgroundColor = Asset.Colors.teal.color
    }

    var body: some View {
        VStack(alignment: .leading) {
            ProfileView()
                .padding([.leading, .top], profileViewPadding)
            List {
                ForEach(SideMenu.sideMenuList) { item in
                    ListButtonView(actionHandler: {
                        selectedItemId = item.id
                    }, sideMenu: item)
                }
                .listRowInsets(EdgeInsets(top: listTopBottom, leading: listLeftRight,
                                          bottom: listTopBottom, trailing: listLeftRight))
            }
            .listStyle(SidebarListStyle())
            
            Button(action: {}) {
                HStack {
                    Image(uiImage: Asset.Images.powerIcon.image)
                        .resizable()
                        .frame(width: frameSize, height: frameSize, alignment: .center)
                    Text(L10n.SideMenu.Label.logout)
                        .font(.system(size: fontSize))
                        .foregroundColor(Color(.white))
                }
            }
            .padding([.leading, .top], logoutBtnPadding)
        }
        .padding([.top, .bottom], bodyPadding)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(Asset.Colors.teal.color))
        .edgesIgnoringSafeArea(.all)
    }
}

struct ListButtonView: View {
    let actionHandler: (() -> Void)
    var sideMenu: SideMenu
    @State var didTap: Bool = false
    let imgHeight: CGFloat = 20
    let size: CGFloat = 16
    let imagePadding: CGFloat = 10
    
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
                    .frame(width: size, height: imgHeight, alignment: .leading)
                    .foregroundColor(didTap ? Color(Asset.Colors.teal.color) : .white)
                    .padding(.leading, imagePadding)
                Text(sideMenu.text)
                    .font(.system(size: size))
                    .foregroundColor(didTap ? Color(Asset.Colors.teal.color) : .white)
                Spacer()
            }
        }.buttonStyle(PrimaryButtonStyle(didPressed: didTap))
    }
}

struct PrimaryButtonStyle: ButtonStyle {
    let height: CGFloat = 60
    let buttonCornerRaduis: CGFloat = 20
    let fontSize: CGFloat = 16
    @State var didPressed: Bool = false
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.system(size: fontSize))
            .frame(maxWidth: .infinity, minHeight: height, maxHeight: height)
            .background(didPressed ? .white : Color(Asset.Colors.teal.color))
            .cornerRadius(buttonCornerRaduis)
    }
}
