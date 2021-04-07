//
//  UIImageView+Extension.swift
//  UserProfile
//
//  Created by Oat on 6/4/2564 BE.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
  func setImage(_ urlString: String) {
    if let url: URL = URL(string: urlString) {
      kf.setImage(with: url)
    }
  }
}
