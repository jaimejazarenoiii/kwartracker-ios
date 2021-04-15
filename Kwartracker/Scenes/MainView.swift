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
    
    init(paddingTop: CGFloat, @ViewBuilder header: @escaping () -> H, @ViewBuilder content: @escaping () -> C) {
        self.headerView = header()
        self.contentView = content()
    }
    
    var body: some View {
        ScrollView {
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
                
                let contentSizeTop = getSafeAreaInset().top + childSize.height
                
                ZStack {
                    Rectangle()
                        .fill(Color(Asset.Colors.solitudeGrey.color))
                        .clipShape(RoundedCorner(radius: 60, corners: [.topLeft, .topRight]))
                    
                    contentView
                    
                }
                .padding(.top, contentSizeTop)
                    
            }
        }
        .background(Color(Asset.Colors.solitudeGrey.color))
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

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let size = CGSize(width: radius, height: radius)
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: size)
        return Path(path.cgPath)
    }
}

struct SizePreferenceKey: PreferenceKey {
    typealias Value = CGSize
    static var defaultValue: Value = .zero

    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = nextValue()
    }
}
