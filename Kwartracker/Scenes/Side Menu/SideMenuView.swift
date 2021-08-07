//
//  SideMenuView.swift
//  Kwartracker
//
//  Created by Veverly Mae Ricaza on 5/24/21.
//

import SwiftUI

struct SideMenuView: View {
    
    @Binding private var selectedItemId: SideMenu
    @Binding var showSidebar: Bool
    
    private let listTopBottom: CGFloat = 3
    private let listLeftRight: CGFloat = 0
    private let frameSize: CGFloat = 15
    private let fontSize: CGFloat = 16
    private let logoutBtnPadding: CGFloat = 25
    private let bodyPadding: CGFloat = 30

    init(
        selectedItem: Binding<SideMenu>,
        showSidebar: Binding<Bool>
    ) {
        self._selectedItemId = selectedItem
        self._showSidebar = showSidebar
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
                        if selectedItemId != item {
                            showSidebar = false
                        }
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
    let sideMenu: SideMenu
    let isSelected: Bool

    private let imgHeight: CGFloat = 20
    private let size: CGFloat = 16
    private let imagePadding: CGFloat = 10
    private let textHeight: CGFloat = 60
    private let cornerRadius: CGFloat = 20
    
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
                .frame(height: textHeight)
            Spacer()
        }
        .background(isSelected ? Color.white : Color(Asset.Colors.teal.color))
        .cornerRadius(cornerRadius)
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
