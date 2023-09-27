//
//  TimeLine.swift
//  Yun
//
//  Created by Yael Javier Zamora Moreno on 09/07/23.
//

import SwiftUI

struct Appointment {
  let date: Date
  let message: String
}

struct TimelineList: View {
  // change these to visually style the timeline
  private static let lineWidth: CGFloat = 2
  private static let dotDiameter: CGFloat = 8

  let items: [Appointment]

  private let dateFormatter: DateFormatter

  init(_ items: [Appointment]) {
    self.items = items
    dateFormatter = DateFormatter()
    // the format of the dates on the timeline
    dateFormatter.dateFormat = "EEE\ndd"
  }

  var body: some View {
    List(Array(items.enumerated()), id: \.offset) { index, item in
      rowAt(index, item: item)
        // removes spacing between the rows
        .listRowInsets(EdgeInsets())
        // hides separators on SwiftUI 3, for other versions
        // check out https://swiftuirecipes.com/blog/remove-list-separator-in-swiftui
        .listRowSeparator(.hidden)
    }
  }

  @ViewBuilder private func rowAt(_ index: Int, item: Appointment) -> some View {
    let calendar = Calendar.current
    let date = item.date
    let hasPrevious = index > 0
    let hasNext = index < items.count - 1
    let isPreviousSameDate = hasPrevious
        && calendar.isDate(date, inSameDayAs: items[index - 1].date)

    HStack {
      ZStack {
        Color.clear // effectively centers the text
        if !isPreviousSameDate {
          Text(dateFormatter.string(from: date))
            .font(.system(size: 14))
            .multilineTextAlignment(.center)
        }
      }
      .frame(width: 30)

      GeometryReader { geo in
        ZStack {
          Color.clear
          line(height: geo.size.height,
               hasPrevious: hasPrevious,
               hasNext: hasNext,
               isPreviousSameDate: isPreviousSameDate)
        }
      }
      .frame(width: 10)

      Text(item.message)
    }
  }

  // this methods implements the rules for showing dots in the
  // timeline, which might differ based on requirements
  @ViewBuilder private func line(height: CGFloat,
                                 hasPrevious: Bool,
                                 hasNext: Bool,
                                 isPreviousSameDate: Bool) -> some View {
    let lineView = Rectangle()
      .foregroundColor(.black)
      .frame(width: TimelineList.lineWidth)
    let dot = Circle()
      .fill(Color.blue)
      .frame(width: TimelineList.dotDiameter,
             height: TimelineList.dotDiameter)
    let halfHeight = height / 2
    let quarterHeight = halfHeight / 2
    if isPreviousSameDate && hasNext {
      lineView
    } else if hasPrevious && hasNext {
      lineView
      dot
    } else if hasNext {
      lineView
        .frame(height: halfHeight)
        .offset(y: quarterHeight)
      dot
    } else if hasPrevious {
      lineView
        .frame(height: halfHeight)
        .offset(y: -quarterHeight)
      dot
    } else {
      dot
    }
  }
}
