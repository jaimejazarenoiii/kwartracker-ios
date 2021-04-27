//
//  BackgroundContainer.swift
//  Kwartracker
//
//  Created by John Ellie Go on 4/14/21.
//

import SwiftUI

struct SkeletonStructure<H: View, C: View>: View {
    private let headerView: H
    private let contentView: C
    
    private let rectRadius: CGFloat = 60
    private let contentTopSpace: CGFloat = 5
    
    init(@ViewBuilder header: @escaping () -> H, @ViewBuilder content: @escaping () -> C) {
        self.headerView = header()
        self.contentView = content()
    }
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
            Color(Asset.Colors.teal.color)
            
            VStack {
                headerView
                    .padding(.top, getSafeAreaInset().top)
                
                ZStack {
                    RoundedCornerRectangle(radius: rectRadius, corner: [.topLeft, .topRight])
                    
                    contentView
                        .padding(.top, contentTopSpace)
                    
                }
                .padding(.top)
            }
        }
        .ignoresSafeArea()
    }
    
    
    // Check if running on preview mode or running on a device
    // https://stackoverflow.com/a/61741858
    func getSafeAreaInset() -> UIEdgeInsets {
        // Set preview environment key
        let previewEnvironmentKey = "XCODE_RUNNING_FOR_PREVIEWS"
        
        // Check if device is runnning on preview mode
        if ProcessInfo.processInfo.environment[previewEnvironmentKey] == "1" {
            // Set default safe insets to iPhone 11
            return UIEdgeInsets(top: 48, left: 0, bottom: 34, right: 0)
            
        } else {
            // Use running device safe area insets
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
