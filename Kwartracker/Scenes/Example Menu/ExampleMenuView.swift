//
//  ExampleMenuView.swift
//  Kwartracker
//
//  Created by Jacob on 3/28/21.
//

import SwiftUI

struct ExampleMenuView: View {
    @EnvironmentObject var store: AppStore
    @State private var showingSheet = false

    var body: some View {
        NavigationView {
            List {
                ForEach(store.state.exampleMenu.menu) { item in
                    NavigationLink(destination: MenuItemView(menuItem: item)) {
                        MenuItemView(menuItem: item)
                    }
                }
                .onDelete(perform: { indexSet in
                    indexSet.forEach {
                        store.send(.exampleMenu(action: .delete(index: $0)))
                    }
                })
            }
            .navigationTitle(L10n.menu)
            .navigationBarItems(trailing: Button(action: {
                showingSheet.toggle()
            }, label: {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $showingSheet, content: {
                AddMenuFormModalView()
                    .environmentObject(store)
            })
            )
        }
    }
}

struct ExampleMenuView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleMenuView()
    }
}

struct MenuItem: Identifiable, Equatable {
    var id: UUID = UUID()
    var name: String = ""
    var price: Double = 0

    static let exampleMenu: [MenuItem] = [
        MenuItem(id: UUID(), name: "Pork BBQ", price: 10),
        MenuItem(id: UUID(), name: "Chicken Thigh BBQ", price: 60),
        MenuItem(id: UUID(), name: "Chicken Breast BBQ", price: 60),
        MenuItem(id: UUID(), name: "Chicken Isaw BBQ", price: 8),
        MenuItem(id: UUID(), name: "Isda Larang", price: 50),
        MenuItem(id: UUID(), name: "Tinoalang Isda", price: 50)
    ]

    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id &&
            lhs.name == rhs.name &&
            lhs.price == rhs.price
    }
}

struct MenuItemView: View {
    var menuItem: MenuItem

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(menuItem.name)
            Text("\(L10n.php) \(menuItem.price, specifier: "%.2f")")
        }
    }
}
