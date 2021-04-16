//
//  SNSButton.swift
//  Kwartracker
//
//  Created by John Ellie Go on 4/16/21.
//

import SwiftUI

struct SNSButton: View {
    let action: String
    
    var body: some View {
        Button(action: {
            
        }, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 17)
                    .fill(getColor())
                    .frame(height: 48)
                    .shadow(color: Color.white.opacity(1), radius: 8, x: -6, y: -6)
                    .shadow(color: Color.black.opacity(0.15), radius: 8, x: 7, y: 7)
                
                HStack {
                    if action != "Sign in" {
                        Image(action.contains("Google") ? Asset.Images.googleIcon.name : Asset.Images.appleIcon.name)
                            .font(.system(size: 20))
                            .foregroundColor(Color.white)
                    }
                    
                    Text(action)
                        .foregroundColor(.white)
                        .font(.system(size: 14))
                }
            }
        })
    }
    
    func getColor() -> Color {
        if action.contains("Google") {
            return Color(Asset.Colors.blueberry.color)
        } else if action.contains("Apple") {
            return Color(Asset.Colors.nightRider.color)
        } else {
            return Color(Asset.Colors.teal.color)
        }
    }
}
