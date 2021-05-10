//
//  ExpensePreviewPage.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 5/7/21.
//

import SwiftUI

struct ExpensePreviewPage: View {
    private let shadowRadius: CGFloat = 8
    private let shadowOffset = CGPoint(x: 6, y: 6)
    private let rectRadius: CGFloat = 20
    private let frameWidth: CGFloat = UIScreen.main.bounds.width * 0.8
    private let baseFrame: CGSize = CGSize(width: 315, height: 133)
    
    var body: some View {
        ZStack(alignment: .leading) {
            BWNeumorphicRectangle(rectRadius: rectRadius,
                                  color: Color.white,
                                  shadowRadius: shadowRadius,
                                  shadowOffset: shadowOffset,
                                  height: self.setHeightRatio(width: frameWidth, baseSize: baseFrame))
        }
        .frame(width: frameWidth,
               height: self.setHeightRatio(width: frameWidth, baseSize: baseFrame))
    }
}

struct ExpensePreviewPage_Previews: PreviewProvider {
    static var previews: some View {
        ExpensePreviewPage()
    }
}
