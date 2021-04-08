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
  
  func roundedImageView() {
    self.layer.borderWidth = 2.5
    self.layer.borderColor = UIColor.white.cgColor
    self.layer.cornerRadius = self.frame.height / 2
  }
  
  func darkenImageView() {
    let coverLayer: CALayer = CALayer()
    
    coverLayer.frame = self.bounds
    coverLayer.backgroundColor = UIColor.black.cgColor
    coverLayer.opacity = 0.3
    self.layer.addSublayer(coverLayer)
  }
}
