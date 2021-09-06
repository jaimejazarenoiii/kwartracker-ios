//
//  ProfilePictureView.swift
//  Kwartracker
//
//  Created by John Ellie Go on 5/28/21.
//

import SwiftUI

struct ProfilePictureView: View {
    let imageSize: CGFloat = 100
    
    var body: some View {
        Image(uiImage: Asset.Images.sampleImage.image)
            .resizable()
            .frame(width: imageSize, height: imageSize, alignment: .center)
            .clipShape(Circle())
    }
}

struct ProfilePictureView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePictureView()
            .previewLayout(.sizeThatFits)
    }
}
