//
//  BackgroundContainer.swift
//  Kwartracker
//
//  Created by John Ellie Go on 4/14/21.
//

import SwiftUI

struct MainView<H: View, C: View>: View {
    private let headerView: H
    private let contentView: C
    
    @State private var childSize: CGSize = .zero
    
    init(@ViewBuilder header: @escaping () -> H, @ViewBuilder content: @escaping () -> C) {
        self.headerView = header()
        self.contentView = content()
    }
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
            Color(Asset.Colors.teal.color)
            
            headerView
                .padding(.top, getSafeAreaInset().top)
                .background(
                    GeometryReader { proxy in
                        Color.clear
                            .preference(key: SizePreferenceKey.self, value: proxy.size)
                    }
                )
                .onPreferenceChange(SizePreferenceKey.self) { preferences in
                    self.childSize = preferences
                }
            
            let contentSizeTop = (getSafeAreaInset().top / 2) + childSize.height
            
            ZStack {
                Rectangle()
                    .fill(Color(Asset.Colors.solitudeGrey.color))
                    .cornerRadius(60, corners: [.topLeft, .topRight])
                    .edgesIgnoringSafeArea(.all)
                
                
                contentView
                    .padding(.top, 5)
            }
            .padding(.top, contentSizeTop)
            
        }
        .ignoresSafeArea()
    }
    
    func getSafeAreaInset() -> UIEdgeInsets {
        // Check if is in preview mode
        let previewEnvironment = "XCODE_RUNNING_FOR_PREVIEWS"
        
        if ProcessInfo.processInfo.environment[previewEnvironment] == "1" {
            // iPhone 11 insets
            return UIEdgeInsets(top: 48, left: 0, bottom: 34, right: 0)
        } else {
            let window = UIApplication.shared.windows[0]
            return window.safeAreaInsets
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
