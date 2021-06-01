//
//  ContentView.swift
//  Kwartracker
//
//  Created by Jacob on 3/25/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var showSidebar: Bool = false
    let width: CGFloat = -100
    let sideBarWidth: CGFloat = 300
        
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
            SideMenuView()
        } content: {
            TransactionHistoryView(showSidebar: $showSidebar)
        }
        .edgesIgnoringSafeArea(.all)
        .gesture(drag)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
