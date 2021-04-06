//
//  Requestable.swift
//  UserProfile
//
//  Created by Oat on 5/4/2564 BE.
//

import Foundation

protocol Request {
  var path: String { get }
  var method: String { get }
  var body: Codable? { get }
}

extension Request {
  func makeRequest(baseUrl: URL) -> URLRequest {
    let url = baseUrl.appendingPathComponent(path)
    var request = URLRequest(url: url)
    request.httpMethod = method
    return request
  }
}
