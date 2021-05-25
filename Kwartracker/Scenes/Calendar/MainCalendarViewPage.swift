//
//  MainCalendarViewPage.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 5/24/21.
//

import SwiftUI

struct MainCalendarViewPage: View {
    @Environment(\.calendar) var calendar
    private let shadowRadius: CGFloat = 8
    private let shadowOffset = CGPoint(x: 6, y: 6)
    private let rectRadius: CGFloat = 17
    private let fontSize: CGFloat = 14
    private let modalSize: CGSize = CGSize(width: 315, height: 500)
    private var year: DateInterval {
        calendar.dateInterval(of: .month, for: Date())!
    }
    var body: some View {
        ZStack {
            Color(Asset.Colors.solitudeGrey.color)
            VStack {
                CalendarTableView(interval: self.year) { date in
                    DayView(day: String(self.calendar.component(.day, from: date)))
                }
                
                Button(action: {}, label: {
                    ZStack {
                        BWNeumorphicRectangle(
                            rectRadius: rectRadius,
                            color: Color(Asset.Colors.teal.color),
                            shadowRadius: shadowRadius,
                            shadowOffset: shadowOffset)
                        
                        Text("Apply")
                            .foregroundColor(.white)
                            .font(.system(size: fontSize))
                    }
                    
                })
                .padding()
                
                Button(action: {}, label: {
                    ZStack {
                        Image(uiImage: Asset.Images.closeIcon.image)
                            .resizable()
                            .frame(width: 10, height: 10)
                    }
                    
                })
                .buttonStyle(CircleButtonStyle(buttonColor: Asset.Colors.solitudeGrey.color, padding: 10))
            }
            .padding()
        }
        .frame(width: modalSize.width,
               height: modalSize.height)
        .cornerRadius(rectRadius)
        .shadow(color: Color.black.opacity(0.2), radius: shadowRadius, x: shadowOffset.x, y: shadowOffset.y)
        .shadow(color: Color.white.opacity(0.7), radius: shadowRadius, x: -shadowOffset.x, y: -shadowOffset.y)
    }
}

struct MainCalendarViewPage_Previews: PreviewProvider {
    static var previews: some View {
        MainCalendarViewPage()
    }
}
