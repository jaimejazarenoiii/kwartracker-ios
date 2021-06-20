//
//  ProfileView.swift
//  Kwartracker
//
//  Created by Veverly Mae Ricaza on 5/24/21.
//

import SwiftUI

struct ProfileView: View {
    let frameSize: CGFloat = 50
    let horizontalPadding: CGFloat = 20
    let topPadding: CGFloat = 50
    let fontSize: CGFloat = 18
    
    var body: some View {
        HStack {
            Image(uiImage: Asset.Images.icSample.image)
                .resizable()
                .frame(width: frameSize, height: frameSize, alignment: .center)
                .clipShape(Circle())
            Text("Samantha Tagli")
                .font(.system(size: fontSize, weight: .medium, design: .default))
                .foregroundColor(Color(.white))
        }
        .padding(.horizontal, horizontalPadding)
        .padding(.top, topPadding)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .background(Color(Asset.Colors.teal.color))
            .previewLayout(.sizeThatFits)
    }
}
