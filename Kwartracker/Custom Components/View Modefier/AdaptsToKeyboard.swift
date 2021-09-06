//
//  AdaptsToKeyboard.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 5/19/21.
//

import SwiftUI
import Combine

/// shorturl.at/tSXY8
struct AdaptsToKeyboard: ViewModifier {
    @State var currentHeight: CGFloat = 0
    private var duration: Double = 0.1
    
    func body(content: Content) -> some View {
        GeometryReader { geometry in
            content
                .padding(.bottom, self.currentHeight)
                .onAppear(perform: {
                    NotificationCenter.Publisher(center: NotificationCenter.default,
                                                 name: UIResponder.keyboardWillShowNotification)
                        .merge(with:
                                NotificationCenter.Publisher(center: NotificationCenter.default,
                                                             name: UIResponder.keyboardWillChangeFrameNotification))
                        .compactMap { notification in
                            withAnimation(.easeOut(duration: duration)) {
                                notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
                            }
                    }
                    .map { rect in
                        rect.height - geometry.safeAreaInsets.bottom
                    }
                    .subscribe(Subscribers.Assign(object: self, keyPath: \.currentHeight))
                    
                    NotificationCenter.Publisher(center: NotificationCenter.default,
                                                 name: UIResponder.keyboardWillHideNotification)
                        .compactMap { notification in
                            CGFloat.zero
                    }
                    .subscribe(Subscribers.Assign(object: self,
                                                  keyPath: \.currentHeight))
                })
        }
    }
}
