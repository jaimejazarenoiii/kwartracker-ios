//
//  OptionView.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 6/17/21.
//

import SwiftUI

struct OptionView: View {
    @Binding var presented: Bool
    @Binding var selectedItem: String?
    var options: [OptionItem]
    private let radius: CGFloat = 0.5
    private let padding: CGFloat = 10
    private let buttonCornerRadius: CGFloat = 16
    private let fontSize: CGFloat = 14
    private let shadowRadius: CGFloat = 8
    private let shadowOffset = CGPoint(x: 6, y: 6)
    private let rectRadius: CGFloat = 30
    private let iconSize: CGFloat = 30
    private let iconCornerRadius: CGFloat = 10
    private let rowHeight: CGFloat = 60
    private var modalHeight: CGFloat {
        let height = rowHeight * CGFloat(options.count)
        let maxHeight =  UIScreen.main.bounds.height * 0.75
        if height > maxHeight {
            return maxHeight
        }
        return height
    }

    var body: some View {
        ZStack {
            Color.clear
                .blur(radius: radius)
                .ignoresSafeArea()
            
            Group {
                Button(action: {
                    presented.toggle()
                }, label: {
                    ZStack {
                        BWNeumorphicRectangle(
                            rectRadius: buttonCornerRadius,
                            color: Color(Asset.Colors.teal.color),
                            shadowRadius: shadowRadius,
                            shadowOffset: shadowOffset)
                        
                        Text(L10n.CalendarPage.Label.apply)
                            .foregroundColor(.white)
                            .font(.system(size: fontSize))
                    }
                    
                })
                .frame(width: UIScreen.main.bounds.width * 0.85)
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            .padding(.bottom, padding * 5)
            
            VStack {
                ScrollView(.vertical, showsIndicators: true) {
                    ForEach(options, id: \.self) { option in
                        Button(action: {
                            debugPrint("row is selected")
                            selectedItem = option.value
                        }, label: {
                            VStack(alignment: .leading) {
                                Spacer()
                                    .frame(height: padding)

                                HStack(alignment: .center, spacing: padding) {
                                    Spacer()
                                        .frame(width: 11)
                                    RoundedRectangle(cornerRadius: iconCornerRadius)
                                        .fill(Color(Asset.Colors.teal.color))
                                        .frame(width: iconSize, height: iconSize)
                                    Text(option.description)
                                        .foregroundColor(Color(Asset.Colors.charcoal.color))
                                        .font(.system(size: fontSize, weight: .medium))
                                }
                                Color(Asset.Colors.mysticBlueGrey.color)
                                    .frame(height: 1)
                            }
                        })
                        .background(
                            RoundedRectangle(cornerRadius: iconCornerRadius)
                                .fill(option.value == selectedItem ?
                                        Color(Asset.Colors.mysticBlueGrey.color) :
                                        Color.clear)
                                .cornerRadius(padding, corners: .allCorners)
                        )
                    }
                }
                .padding(padding)
            }
            .frame(maxWidth: UIScreen.main.bounds.width * 0.85,
                   maxHeight: modalHeight)
            .background(
                GeometryReader { proxy in
                    NeumorphicEffect(rectSize:
                                        CGSize(width: proxy.size.width,
                                               height: proxy.size.height))
                }
            )
        }
    }
}
