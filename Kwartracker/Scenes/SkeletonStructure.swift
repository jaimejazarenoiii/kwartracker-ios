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
                    Rectangle()
                        .fill(Color(Asset.Colors.solitudeGrey.color))
                        .cornerRadius(60, corners: [.topLeft, .topRight])
                        .edgesIgnoringSafeArea(.bottom)
                    
                    contentView
                        .padding(.top, 5)
                    
                }.padding(.top)
            }
        }
        .ignoresSafeArea()
    }
    
    func getSafeAreaInset() -> UIEdgeInsets {
        // Check if is in preview mode
        let previewEnvironmentKey = "XCODE_RUNNING_FOR_PREVIEWS"
        
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
