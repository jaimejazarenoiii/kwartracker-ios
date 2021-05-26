//
//  ProfileView.swift
//  Kwartracker
//
//  Created by Veverly Mae Ricaza on 5/24/21.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        HStack {
            Image(uiImage: Asset.Images.icSample.image)
                .resizable()
                .frame(width: 40, height: 40, alignment: .center)
                .clipShape(Circle())
            Text("Samantha Tagli")
                .font(.system(size: 18, weight: .medium, design: .default))
                .foregroundColor(Color(.white))
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
