//
//  MainCalendarViewPage.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 5/24/21.
//

import SwiftUI

struct MainCalendarViewPage: View {
    @Environment(\.calendar) var calendar
    private let frameHeight: CGFloat = 500
    private let shadowRadius: CGFloat = 8
    private let shadowOffset = CGPoint(x: 6, y: 6)
    private let rectRadius: CGFloat = 17
    private let fontSize: CGFloat = 14
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
                
                // will be updated later
                Button(action: {}, label: {
                    ZStack {
                        Image(uiImage: Asset.Images.closeIcon.image)
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                    
                })
            }
            .padding()
        }
        .frame(width: UIScreen.main.bounds.width * 0.8,
               height: frameHeight)
        .cornerRadius(rectRadius)
    }
}

struct MainCalendarViewPage_Previews: PreviewProvider {
    static var previews: some View {
        MainCalendarViewPage()
    }
}
