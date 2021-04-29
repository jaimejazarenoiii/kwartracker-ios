//
//  ImageView.swift
//  Kwartracker
//
//  Created by Veverly Mae Ricaza Veverly on 4/29/21.
//

import SwiftUI

struct ImageView: View {
    
    let imageType: ImageType
    
    var body: some View {
        VStack{
            Image(uiImage: imageType.image)
        }
    }
    
    enum ImageType {
        case success
        case deleted
        case confirmation
        
        var image: UIImage {
            switch self {
            case .success:
                return Asset.Images.checkIcon.image
            case .deleted:
                return Asset.Images.trashIcon2.image
            case .confirmation:
                return UIImage()
            }
        }
    }
}
