//
//  BackgroundContainer.swift
//  Kwartracker
//
//  Created by John Ellie Go on 4/14/21.
//

import SwiftUI

struct SkeletalView<H: View, C: View>: View {
    private let HeaderView: H
    private let contentView: C
    
    private let topBodyMargin: CGFloat = 5
    
    // Check if running on preview mode or running on a device
    // https://stackoverflow.com/a/61741858
    private var safeAreaInsets: UIEdgeInsets {
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
    
    init(@ViewBuilder header: @escaping () -> H, @ViewBuilder body: @escaping () -> C) {
        self.HeaderView = header()
        self.contentView = body()
    }
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
            Color(Asset.Colors.teal.color)
            
            VStack {
                HeaderView
                    .padding(.top, safeAreaInsets.top)
                
                BodyView(contentView: contentView)
            }
        }
        .ignoresSafeArea()
    }
}

private struct BodyView<ContentView: View>: View {
    let contentView: ContentView
    
    private let rectRadius: CGFloat = 60
    
    var body: some View {
        ZStack {
            RoundedCornerRectangle(radius: rectRadius, corner: [.topLeft, .topRight])
            
            VStack(spacing: 0) {
                contentView
                    .clipShape(RoundedRectangle(cornerRadius: rectRadius))
            }
        }
        .padding(.top)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
