//
//  SideBarStack.swift
//  Kwartracker
//
//  Created by Veverly Mae Ricaza on 5/25/21.
//

import SwiftUI

struct SideBarStack<SidebarContent: View, Content: View>: View {
    
@Binding var showSidebar: Bool

    let sidebarContent: SidebarContent
    let mainContent: Content
    let sidebarWidth: CGFloat
    
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
                .offset(x: showSidebar ? 0 : -1 * sidebarWidth, y: 0)
                .animation(Animation.easeInOut.speed(2))
            mainContent
                .overlay(
                    Group {
                        if showSidebar {
                            Color.white
                                .opacity(showSidebar ? 0.01 : 0)
                                .onTapGesture {
                                    self.showSidebar = false
                                }
                        } else {
                            Color.clear
                            .opacity(showSidebar ? 0 : 0)
                            .onTapGesture {
                                self.showSidebar = false
                            }
                        }
                    }
                )
                .offset(x: showSidebar ? sidebarWidth : 0, y: 0)
                .animation(Animation.easeInOut.speed(2))
        }
    }
}
