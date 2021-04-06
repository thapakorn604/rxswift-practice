//
//  BaseResult.swift
//  UserProfile
//
//  Created by Oat on 5/4/2564 BE.
//

import Foundation

class BaseResult<T: Codable>: Codable {
    public var result: T
}
