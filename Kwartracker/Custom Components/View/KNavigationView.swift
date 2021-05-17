//
//  KNavigationView.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 5/17/21.
//

import SwiftUI

struct KNavigationView<B: View>: View {
    var navigationTitle: String
    var destinationView: AnyView?
    var rightButton: B?
    @Binding var rightButtonToggle: Bool
    
    init(_ title: String,
         destination: AnyView?,
         buttonToggle: Binding<Bool>,
         @ViewBuilder content: @escaping () -> B?) {
        self.navigationTitle = title
        self.destinationView = destination
        self._rightButtonToggle = buttonToggle
        self.rightButton = content()
    }
    
    var body: some View {
        HStack {
            Spacer()
                .frame(width: 30)

            Button(action: {
            }) {
                Image(uiImage: Asset.Images.arrowLeftIconWhite.image)
                    .frame(width: 10, height: 10)
            }
            .buttonStyle(
                CircleButtonStyle(buttonColor: Asset.Colors.teal.color)
            )

            Spacer()

            Text(navigationTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .font(.title2)

            Spacer()
            
            if destinationView != nil {
                NavigationLink(
                    destination: AnyView(destinationView),
                    isActive: $rightButtonToggle) {
                    rightButton
                }.navigationBarHidden(true)
            }
            
            Spacer()
                .frame(width: 30)
        }
        .background(Color(Asset.Colors.teal.color))
    }
}
