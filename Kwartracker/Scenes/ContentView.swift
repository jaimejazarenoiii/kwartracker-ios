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
        Text("Test")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
