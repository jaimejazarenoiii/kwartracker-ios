//
//  MonthView.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 5/24/21.
//

import SwiftUI

struct MonthView<DateView>: View where DateView: View {
    @Environment(\.calendar) var calendar

    @State private var month: Date
    private let numberOfDaysInWeek: Int = 7
    private let weekdayHeaderFontSize: CGFloat = 10
    private let padding: CGFloat = 4
    private let size: CGFloat = 35
    let content: (Date) -> DateView

    init(
        month: Date,
        showHeader: Bool = true,
        localizedWeekdays: [String] = [],
        @ViewBuilder content: @escaping (Date) -> DateView
    ) {
        self._month = State(initialValue: month)
        self.content = content
    }
   
    var body: some View {
        VStack {
            header
            HStack {
                ForEach(0..<numberOfDaysInWeek, id: \.self) {index in
                    Text(getWeekDaysSorted()[index].uppercased())
                        .foregroundColor(Color(Asset.Colors.asureishWhite.color))
                        .font(.system(size: weekdayHeaderFontSize,
                                      weight: .bold))
                        .frame(width: size, height: size)
                }
            }
            
            ForEach(weeks, id: \.self) { week in
                WeekView(week: week, content: self.content)
            }
        }
    }
    
    private var weeks: [Date] {
        guard
            let monthInterval = calendar.dateInterval(of: .month, for: month)
            else { return [] }
        return calendar.generateDates(
            inside: monthInterval,
            matching: DateComponents(hour: 0, minute: 0, second: 0, weekday: calendar.firstWeekday)
        )
    }

    private var header: some View {
        let component = calendar.component(.month, from: month)
        let formatter = component == 1 ? DateFormatter.monthAndYear : .month
        let fontSize: CGFloat = 14
        let sidePadding: CGFloat = 10
        
        return
            HStack {
                Button(action: {
                    self.changeDateBy(-1)
                }) {
                    Image(uiImage: Asset.Images.arrowLeftIcon.image)
                        .resizable()
                        .frame(width: sidePadding, height: sidePadding)
                }
                .buttonStyle(CircleButtonStyle(buttonColor: Asset.Colors.solitudeGrey.color, padding: sidePadding))
                
                Spacer()
                
                Text(formatter.string(from: month).uppercased())
                    .font(.system(size: fontSize,
                                  weight: .bold))
                    .foregroundColor(Color(Asset.Colors.nightRider.color))
                
                Spacer()
                
                Button(action: {
                    self.changeDateBy(1)
                }) {
                    Image(uiImage: Asset.Images.arrowRightIcon.image)
                        .resizable()
                        .frame(width: sidePadding, height: sidePadding)
                }
                .buttonStyle(CircleButtonStyle(buttonColor: Asset.Colors.solitudeGrey.color, padding: sidePadding))
            }
            .padding(sidePadding)
    }
    
    func changeDateBy(_ months: Int) {
        if let date = Calendar.current.date(byAdding: .month, value: months, to: month) {
            self.month = date
        }
    }
    
    func getWeekDaysSorted() -> [String] {
        let weekDays = Calendar.current.shortWeekdaySymbols
        let sortedWeekDays = Array(weekDays[Calendar.current.firstWeekday - 1 ..<
                                                Calendar.current.shortWeekdaySymbols.count] +
                                    weekDays[0 ..< Calendar.current.firstWeekday - 1])
        return sortedWeekDays
    }
}
