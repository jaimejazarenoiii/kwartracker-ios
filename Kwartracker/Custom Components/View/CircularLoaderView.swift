//
//  CircularLoaderView.swift
//  Kwartracker
//
//  Created by Jacob on 5/7/21.
//

import SwiftUI

struct CircularLoaderView: View {
    @State private var animate = false
    var body: some View {
        Circle()
            .trim(from: 0, to: 0.75)
            .stroke(AngularGradient(gradient: .init(colors: [Color(Asset.Colors.teal.color),
                                                             Color(Asset.Colors.teal.color)]),
                                    center: .center),
                    style: StrokeStyle(lineWidth: 5, lineCap: .round))
            .rotationEffect(.init(degrees: animate ? 360 : 0))
            .animation(Animation.linear(duration: 0.7).repeatForever(autoreverses: false))
            .onAppear {
                animate = true
            }
    }
}
