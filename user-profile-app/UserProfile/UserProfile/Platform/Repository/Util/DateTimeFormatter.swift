//
//  DateTimeFormatter.swift
//  UserProfile
//
//  Created by Oat on 9/4/2564 BE.
//

import Foundation

class DateTimeFormatter {
  private let dateFormatter: DateFormatter = DateFormatter()
  static let shared: DateTimeFormatter = DateTimeFormatter()
  
  fileprivate func getTimeConvention() -> TimeConvention {
    let locale: Locale = NSLocale.current
    
    guard let timeSystem: String = DateFormatter.dateFormat(fromTemplate: "j", options: 0, locale: locale) else { return .standard }
    
    if (timeSystem == "HH") {
      return .military
    }
    return .standard
  }
  
  fileprivate func getDateByString(_ dateString: String) -> Date? {
    dateFormatter.dateFormat = DateTimeFormats.defaultFormat
    guard let convertedDate: Date = dateFormatter.date(from: dateString) else { return nil }
    return convertedDate
  }
  
  fileprivate func getActualYearValue(_ year: Int) -> Int {
    switch Locale.current.calendar.identifier {
    case.buddhist:
      return year + 543
    default:
      return year
    }
  }
  
  fileprivate func isCurrentYear(_ date: Date) -> Bool {
    dateFormatter.dateFormat = DateTimeFormats.onlyYear
    let currentYear = Int(dateFormatter.string(from: Date()))
    let yearToCheck = getActualYearValue(Int(dateFormatter.string(from: date))!)
    
    return yearToCheck == currentYear
  }
  
  fileprivate func formatDateTimeInCurrentYear(_ date: Date) -> String {
    switch getTimeConvention() {
    case .military:
      dateFormatter.dateFormat = DateTimeFormats.militaryFormatCurrenYear
      return dateFormatter.string(from: date)
    case .standard:
      dateFormatter.dateFormat = DateTimeFormats.standardFormatCurrentYear
      return dateFormatter.string(from: date)
    }
  }
  
  fileprivate func formateDateTimeByDefault(_ date: Date) -> String {
    switch getTimeConvention() {
    case .military:
      dateFormatter.dateFormat = DateTimeFormats.militaryFormat
      return dateFormatter.string(from: date)
    case .standard:
      dateFormatter.dateFormat = DateTimeFormats.standardFormat
      return dateFormatter.string(from: date)
    }
  }
  
  func formatDateTime(_ dateString: String) -> String {
    guard let dateToFormat = getDateByString(dateString) else { return dateString }
    var formattedDateString: String = ""
    
    if (isCurrentYear(dateToFormat)) {
      formattedDateString = formatDateTimeInCurrentYear(dateToFormat)
    } else {
      formattedDateString = formateDateTimeByDefault(dateToFormat)
    }
    
    return formattedDateString
  }
}
