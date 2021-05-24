//
//  SideMenuView.swift
//  Kwartracker
//
//  Created by Veverly Mae Ricaza on 5/24/21.
//

import SwiftUI

struct SideMenuView: View {
        
    init() {
        UITableView.appearance().backgroundColor = Asset.Colors.teal.color
        UITableView.appearance().separatorStyle = .none
    }

    var body: some View {
        VStack(alignment: .leading) {
            ProfileView()
                .padding([.leading, .top], 20)
            List {
                ForEach(SideMenu.allCases) {
                    MenuRowView(sideMenu: $0)
                        .padding([.leading, .trailing], 5)
                }
                .listRowBackground(Color(Asset.Colors.teal.color))
            }
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

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
