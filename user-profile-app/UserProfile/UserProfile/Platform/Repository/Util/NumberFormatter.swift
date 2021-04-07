//
//  NumberFormatter.swift
//  UserProfile
//
//  Created by Oat on 7/4/2564 BE.
//

import Foundation

class NumberFormatter {
  static let shared: NumberFormatter = NumberFormatter()
  
  private func formatMillionsNumber(number: Int) -> String {
    let millions: Double = Double(number) / 1000000.0
    let formattedMillions:String = String(format: "%.1f", millions)
    return "\(formattedMillions)M"
  }
  
  private func formatHundredThoundsandNumber(number: Int) -> String {
    let hundredThoundsands: Int = number / 1000
    return "\(hundredThoundsands)K"
  }
  
  private func formatThoundsandsNumber(number: Int) -> String {
    let thoundsands: Double = Double(number) / 1000.0
    let formattedThounsands: String = String(format: "%.1f",thoundsands)
    return "\(formattedThounsands)K"
  }
  
  func formatNumber(number: Int) -> String {
    if(number >= 1000000) {
      return formatMillionsNumber(number: number)
    } else if(number >= 100000) {
      return formatHundredThoundsandNumber(number: number)
    } else if (number >= 1000) {
      return formatThoundsandsNumber(number: number)
    }
    return String(number)
  }
}
