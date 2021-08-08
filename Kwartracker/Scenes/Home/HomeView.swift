//
//  HomeView.swift
//  Kwartracker
//
//  Created by Jacob on 8/7/21.
//

import SwiftUI

struct HomeView: View {
    @State var showSidebar: Bool = false
    @State var selectedMenu: SideMenu = .home

    private let width: CGFloat = -100
    private let sideBarWidth: CGFloat = 300

    var body: some View {
        //https://blckbirds.com/post/side-menu-hamburger-menu-in-swiftui/
        let drag = DragGesture()
            .onEnded {
                if $0.translation.width < width {
                    withAnimation {
                        self.showSidebar = false
                    }
                }
            }

        return SideBarStack(sidebarWidth: sideBarWidth, showSidebar: $showSidebar) {
            SideMenuView(selectedItem: $selectedMenu, showSidebar: $showSidebar)
        } content: {
            if selectedMenu == .myProfile {
                MyProfileSideMenuView(showSidebar: $showSidebar)
            } else if selectedMenu == .settings {
                SettingsView()
            } else {
                TransactionHistoryView(showSidebar: $showSidebar)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .gesture(drag)
    }
}
