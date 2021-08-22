//
//  ActivityIndicator.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 7/12/21.
//

import Foundation
import SwiftUI

//https://stackoverflow.com/questions/56496638/activity-indicator-in-swiftui
struct ActivityIndicator: View {
    @State private var isAnimating: Bool = false
    var body: some View {
        GeometryReader { geometry in
            ForEach(0..<5) { index in
                ZStack {
                    Circle()
                        .frame(width: geometry.size.width / 5,
                               height: geometry.size.height / 5)
                        .scaleEffect(!isAnimating ? 1 - CGFloat(index) / 5 :
                                        0.2 + CGFloat(index) / 5)
                        .offset(y: geometry.size.width / 10 - geometry.size.height / 2)
                }
                .frame(width: geometry.size.width,
                        height: geometry.size.height)
                .rotationEffect(!isAnimating ? .degrees(0) :
                                    .degrees(360))
                .animation(Animation
                            .timingCurve(0.5, 0.15 + Double(index) / 5, 0.25, 1, duration: 1.5)
                            .repeatForever(autoreverses: false))
            }
        }
        .aspectRatio(1, contentMode: .fit)
        .onAppear {
            self.isAnimating = true
        }
    }
}
