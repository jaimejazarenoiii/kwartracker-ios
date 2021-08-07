//
//  MyProfileSideMenuView.swift
//  Kwartracker
//
//  Created by Jacob on 8/7/21.
//

import SwiftUI

struct MyProfileSideMenuView: SideMenuPageDelegate, View {
    @Binding var showSidebar: Bool

    init(showSidebar: Binding<Bool>) {
        self._showSidebar = showSidebar
    }

    var body: some View {
        MyProfileView()
    }
}
