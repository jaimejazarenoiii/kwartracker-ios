//
//  MenuRowView.swift
//  Kwartracker
//
//  Created by Veverly Mae Ricaza on 5/24/21.
//

import SwiftUI

struct MenuRowView: View {
    var sideMenu: SideMenu
    
    var body: some View {
        HStack {
            Image(uiImage: sideMenu.image)
                .resizable()
                .frame(width: 15, height: 15, alignment: .center)
            Text(sideMenu.text)
                .font(.system(size: 14))
                .foregroundColor(Color(.white))
        }.padding([.top, .bottom], 20)
    }
}

struct MenuRowView_Previews: PreviewProvider {
    static var previews: some View {
        MenuRowView(sideMenu: .home)
    }
}
