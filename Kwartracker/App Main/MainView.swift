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
    private let paddingTop: CGFloat
    
    init(@ViewBuilder header: @escaping () -> H, @ViewBuilder content: @escaping () -> C) {
        self.headerView = header()
        self.contentView = content()
        self.paddingTop = 75.0
    }
    
    init(paddingTop: CGFloat, @ViewBuilder header: @escaping () -> H, @ViewBuilder content: @escaping () -> C) {
        self.paddingTop = paddingTop
        self.headerView = header()
        self.contentView = content()
    }
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
            Color(Asset.Colors.teal.color)
                .ignoresSafeArea()
            
            headerView
                
            ZStack {
                Rectangle()
                    .fill(Color(Asset.Colors.solitudeGrey.color))
                    .clipShape(RoundedCorner(radius: 60, corners: [.topLeft, .topRight]))
                    .edgesIgnoringSafeArea(.all)
                
                contentView
                    .padding(.top, 70)
                
            }
            .padding(.top, paddingTop)
        }
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
