//
//  CalendarTableView.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 5/24/21.
//

import SwiftUI

// https://gist.github.com/mecid/f8859ea4bdbd02cf5d440d58e936faec
struct CalendarTableView: View {
    @Environment(\.calendar) var calendar
    @Environment(\.presentationMode) var presentationMode
    @Binding var dateRawString: String
    @State private var dayButtonToggle: Bool = false
    @State private var dateString: String = ""
    
    private let dateFormat: String = "yyyy-MM-dd"
    private let shadowRadius: CGFloat = 8
    private let shadowOffset = CGPoint(x: 6, y: 6)
    private let rectRadius: CGFloat = 30
    private let fontSize: CGFloat = 14
    private let buttonSize: CGFloat = 10
    private let radius: CGFloat = 0.5
    private let padding: CGFloat = 30
    
    private var dateFromStr: Date? {
        get {
            if dateString.isEmpty {
                return dateRawString.toDate(dateFormat)?.date
            }
            return dateString.toDate(dateFormat)?.date
        }
    }
    private var year: DateInterval {
        calendar.dateInterval(of: .month, for: Date())!
    }
    
    private var months: [Date] {
        calendar.generateDates(
            inside: year,
            matching: DateComponents(day: 1, hour: 0, minute: 0, second: 0)
        )
    }
    var body: some View {
        ZStack {
            Color.clear
                .blur(radius: radius)
                .ignoresSafeArea()
            VStack {
                ForEach(months, id: \.self) { month in
                    MonthView(month: month) { date in
                        Button(action: {
                            dateString = date.dateByAdding(1, .day).toFormat(dateFormat)
                        }, label: {
                            dayView(of: date)
                        })
                    }
                }
                .padding(.top, padding)
                ActionButtons
            }
            .padding([.leading, .trailing], padding)
            .background(
                GeometryReader { proxy in
                    RoundedRectangle(cornerRadius: rectRadius)
                        .fill(Color(Asset.Colors.solitudeGrey.color))
                        .frame(width: proxy.size.width * 0.85,
                               height: proxy.size.height)
                        .position(x: proxy.size.width / 2,
                                  y: proxy.size.height / 2)
                        .shadow(color: Color.black.opacity(0.2),
                                radius: shadowRadius,
                                x: shadowOffset.x,
                                y: shadowOffset.y)
                        .shadow(color: Color.white.opacity(0.7),
                                radius: shadowRadius,
                                x: -shadowOffset.x,
                                y: -shadowOffset.y)
                }
            )
        }
    }
    
    private var ActionButtons: some View {
        let buttonPadding: CGFloat = 10
        let buttonCornerRadius: CGFloat = 16
        return VStack {
            Button(action: {
                self.dateRawString = self.dateString
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                ZStack {
                    BWNeumorphicRectangle(
                        rectRadius: buttonCornerRadius,
                        color: Color(Asset.Colors.teal.color),
                        shadowRadius: shadowRadius,
                        shadowOffset: shadowOffset)
                    
                    Text(L10n.Button.Label.apply)
                        .foregroundColor(.white)
                        .font(.system(size: fontSize))
                }
                
            })
            .padding([.leading, .trailing], padding)
            
            Spacer()
                .frame(height: padding)
            
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                ZStack {
                    Image(uiImage: Asset.Images.closeIcon.image)
                        .resizable()
                        .frame(width: buttonSize, height: buttonSize)
                }
                
            })
            .buttonStyle(CircleButtonStyle(buttonColor: Asset.Colors.solitudeGrey.color,
                                           padding: buttonPadding))
            Spacer()
                .frame(height: padding)
        }
    }
    
    private func dayView(of date: Date) -> AnyView {
        let stringDay =  String(self.calendar.component(.day, from: date))
        let today = Date()
        
        guard let targetDate = dateFromStr,
              today < targetDate else {
            return AnyView(DayView(day: stringDay))
        }
        
        let range = today...targetDate
        if range.contains(date) {
           return AnyView(SelectedDayView(day: stringDay))
        } else {
           return AnyView(DayView(day: stringDay))
        }
    }
}

struct CalendarTableView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarTableView(dateRawString: Binding.constant("2021-06-30"))
    }
}
