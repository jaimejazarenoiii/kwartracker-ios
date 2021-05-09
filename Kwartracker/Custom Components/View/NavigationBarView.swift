//
//  NavigationBarView.swift
//  Kwartracker
//
//  Created by Jacob on 5/9/21.
//

import SwiftUI

struct NavigationBarView<LeftBarView: View, RightBarView: View>: View {
    private let leftBarView: LeftBarView
    private let title: String
    private let rightBarView: RightBarView

    init(
        title: String,
        @ViewBuilder leftBarViewContent: @escaping () -> LeftBarView,
        @ViewBuilder rightBarViewContent: @escaping () -> RightBarView
    ) {
        self.title = title
        leftBarView = leftBarViewContent()
        rightBarView = rightBarViewContent()
    }

    var body: some View {
        HStack {
            leftBarView

            Spacer()

            Text(title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .font(.title2)

            Spacer()

            rightBarView
        }
        .padding([.leading, .trailing], 25)
    }
}
