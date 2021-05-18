//
//  KNavigationView.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 5/17/21.
//

import SwiftUI

struct KNavigationView<B: View>: View {
    @Environment(\.presentationMode) var presentationMode
    private var buttonSize: CGFloat = 10
    private var space: CGFloat = 30
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
                .frame(width: space)

            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(uiImage: Asset.Images.arrowLeftIconWhite.image)
                    .frame(width: buttonSize, height: buttonSize)
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
                .frame(width: space)
        }
        .background(Color(Asset.Colors.teal.color))
    }
}
