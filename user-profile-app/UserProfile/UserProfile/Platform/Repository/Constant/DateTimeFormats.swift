//
//  DateFormats.swift
//  UserProfile
//
//  Created by Oat on 9/4/2564 BE.
//

import Foundation

enum TimeConvention {
  case standard
  case military
}

struct DateTimeFormats {
  static let defaultFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
  static let standardFormat = "dd MMMM yyyy, h:mm a"
  static let militaryFormat = "dd MMMM yyyy, HH:mm"
  static let standardFormatCurrentYear = "dd MMMM, h:mm a"
  static let militaryFormatCurrenYear = "dd MMMM, HH:mm"
  static let onlyYear = "yyyy"
}

