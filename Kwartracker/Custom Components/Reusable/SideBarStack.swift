//
//  SideBarStack.swift
//  Kwartracker
//
//  Created by Veverly Mae Ricaza on 5/25/21.
//

import SwiftUI

//https://betterprogramming.pub/create-a-sidebar-menu-180ca218eaf2
struct SideBarStack<SidebarContent: View, Content: View>: View {
    
    @Binding var showSidebar: Bool

    let sidebarContent: SidebarContent
    let mainContent: Content
    let sidebarWidth: CGFloat
    let sideBarX: CGFloat = -1
    let sideBarShowOpacity: Double = 0.01
    let sideBarOpacity: Double = 0
    let sideBar: CGFloat = 0
    let animationSpeed: Double = 2
    
    init(sidebarWidth: CGFloat, showSidebar: Binding<Bool>,
         @ViewBuilder sidebar: ()->SidebarContent,
         @ViewBuilder content: ()->Content) {
        
        self.sidebarWidth = sidebarWidth
        self._showSidebar = showSidebar
        sidebarContent = sidebar()
        mainContent = content()
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            sidebarContent
                .frame(width: sidebarWidth, alignment: .center)
                .offset(x: showSidebar ? sideBar : sideBarX * sidebarWidth, y: sideBar)
                .animation(Animation.easeInOut.speed(animationSpeed))
            mainContent
                .overlay(
                    Group {
                        if showSidebar {
                            Color.white
                                .opacity(showSidebar ? sideBarShowOpacity : sideBarOpacity)
                                .onTapGesture {
                                    self.showSidebar = false
                                }
                        } else {
                            Color.clear
                            .opacity(showSidebar ? sideBarOpacity : sideBarOpacity)
                            .onTapGesture {
                                self.showSidebar = false
                            }
                        }
                    }
                )
                .offset(x: showSidebar ? sidebarWidth : sideBar, y: sideBar)
                .animation(Animation.easeInOut.speed(animationSpeed))
        }
    }
}
