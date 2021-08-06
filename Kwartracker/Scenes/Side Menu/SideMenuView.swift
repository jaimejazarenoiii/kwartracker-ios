//
//  SideMenuView.swift
//  Kwartracker
//
//  Created by Veverly Mae Ricaza on 5/24/21.
//

import SwiftUI

struct SideMenuView: View {

    @State private var selectedItemId: SideMenu = .home
    
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
            List {
                ForEach(SideMenu.sideMenuList, id: \.self) { item in
                    SideMenuRow(sideMenu: item, isSelected: selectedItemId == item)
                    .onTapGesture {
                        selectedItemId = item
                    }
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

struct SideMenuRow: View {
    var sideMenu: SideMenu
    let isSelected: Bool
    let imgHeight: CGFloat = 20
    let size: CGFloat = 16
    let imagePadding: CGFloat = 10
    
    var body: some View {
        HStack {
            Image(uiImage: sideMenu.image)
                .renderingMode(.template)
                .frame(width: size, height: imgHeight, alignment: .leading)
                .foregroundColor(isSelected ? Color(Asset.Colors.teal.color) : .white)
                .padding(.leading, imagePadding)
            Text(sideMenu.text)
                .font(.system(size: size))
                .foregroundColor(isSelected ? Color(Asset.Colors.teal.color) : .white)
                .frame(height: 60)
            Spacer()
        }
        .background(isSelected ? Color.white : Color(Asset.Colors.teal.color))
        .cornerRadius(20)
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
