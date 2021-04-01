//
//  AddMenuFormModalView.swift
//  Kwartracker
//
//  Created by Jacob on 3/31/21.
//

import SwiftUI

struct AddMenuFormModalView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var store: AppStore

    @State private(set) var menuName: String = ""
    @State private(set) var price: String = ""

    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Text(L10n.newMenu)
                    .font(.title)
                    .bold()
                    .frame(height: 45)
                    .padding(.top, 20)

                TextField(L10n.menuTortangTalong, text: $menuName)
                    .padding([.leading, .trailing], 20)
                    .frame(height: 50)
                    .background(Color(.white))

                TextField(L10n.pricePlaceholder, text: $price)
                    .padding([.leading, .trailing], 20)
                    .frame(height: 50)
                    .background(Color(.white))

                Divider()
                    .background(Color(.clear))

                Button {
                    let menuItem = MenuItem(
                        id: UUID(),
                        name: menuName,
                        price: Double(price) ?? 0)
                    store.send(.exampleMenu(action: .add(item: menuItem)))
                    clearForm()
                } label: {
                    HStack {
                        Image(systemName: "tray.and.arrow.down.fill")
                            .foregroundColor(Color(.white))

                        Text(L10n.addNewMenu)
                            .foregroundColor(Color(.white))
                    }
                    .frame(width: 200, height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                }

                Spacer()
            }
        }
    }

    func clearForm() {
        menuName = ""
        price = ""
    }
}
