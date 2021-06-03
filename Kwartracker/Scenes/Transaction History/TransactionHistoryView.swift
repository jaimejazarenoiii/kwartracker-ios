//
//  TransactionHistoryView.swift
//  Kwartracker
//
//  Created by Veverly Mae Ricaza on 5/25/21.
//

import SwiftUI

struct TransactionHistoryView: View {
    
    @Binding var showSidebar: Bool
    @State var showMenu = false
    
    let fontSizeHeaderTitle: CGFloat = 15
    let fontSizeHeaderName: CGFloat = 18
    let imageFrameSize: CGFloat = 50
    let horizontalPadding: CGFloat = 40
    
    init(showSidebar: Binding<Bool>) {
        self._showSidebar = showSidebar
    }
    
    var body: some View {
        SkeletalView(header: {
            HStack {
                Button(action: {
                    showSidebar.toggle()
                }, label: {
                    Image(uiImage: Asset.Images.menuIcon.image)
                })
                VStack {
                    Text("Hello,")
                        .font(.system(size: fontSizeHeaderTitle, weight: .regular, design: .default))
                        .foregroundColor(.white)
                    Text("Samantha!")
                        .font(.system(size: fontSizeHeaderName, weight: .bold, design: .default))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                }
                Image(uiImage: Asset.Images.icSample.image)
                    .resizable()
                    .frame(width: imageFrameSize, height: imageFrameSize, alignment: .center)
                    .clipShape(Circle())
            }
            .padding(.horizontal, horizontalPadding)
        }, body: {
        
        })
    }
}


