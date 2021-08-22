//
//  HomeView.swift
//  Kwartracker
//
//  Created by Jacob on 8/7/21.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var store: AppStore
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
            TransactionHistoryView(showSidebar: $showSidebar)
                .opacity([SideMenu.home, .transaction, .reports].contains(selectedMenu) ? 1 : 0)

            MyProfileView(navigationBackAction: { showSidebar = true })
                .opacity(selectedMenu == .myProfile ? 1 : 0)
            
            WalletPageView(navigationBackAction: { showSidebar = true })
                .opacity(selectedMenu == .wallets ? 1 : 0)

            NavigationView {
                SettingsView(navigationBackAction: { showSidebar = true })
            }.opacity(selectedMenu == .settings ? 1 : 0)
        }
        .edgesIgnoringSafeArea(.all)
        .gesture(drag)
    }
}
