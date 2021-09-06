//
//  ProgressView.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 5/14/21.
//

import SwiftUI

struct ProgressView: View {
    let rectFrame: CGSize
    private let shadowOffset: CGPoint = CGPoint(x: 15, y: 15)
    private let radius: CGFloat = 5
    private let shadowColorOpacity: Double = 0.15
    // to be passed on later
    let progress: CGFloat = 0.4
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            Rectangle()
                .fill(Color(Asset.Colors.quartz.color))
            
            // Progress Bar
            Rectangle()
                .fill(Color(Asset.Colors.teal.color))
                .frame(width: min(rectFrame.width,
                                  rectFrame.width * progress))
                .shadow(color: Color.white.opacity(shadowColorOpacity),
                        radius: radius,
                        x: -shadowOffset.x,
                        y: -shadowOffset.y)
                .shadow(color: Color.black.opacity(shadowColorOpacity),
                        radius: radius,
                        x: shadowOffset.x,
                        y: shadowOffset.y)
                .blur(radius: radius)
                .animation(.linear)
                .clipped()
                .cornerRadius(rectFrame.height / 2)
            
        }
        .cornerRadius(rectFrame.height / 2)
        .frame(width: rectFrame.width,
               height: rectFrame.height)
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView(rectFrame: CGSize(width: 275, height: 12))
    }
}

