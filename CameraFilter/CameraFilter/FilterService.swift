//
//  FilterService.swift
//  CameraFilter
//
//  Created by Oat on 20/4/2564 BE.
//

import Foundation
import UIKit
import CoreImage
import RxSwift

class FilterService {
  private var context: CIContext
  
  init() {
    self.context = CIContext()
  }
  
  func applyFilter(to inputImage: UIImage) -> Observable<UIImage> {
    return Observable<UIImage>.create { (observer) -> Disposable in
      self.applyFilter(to: inputImage) { (filteredImage) in
        observer.onNext(filteredImage)
      }
      return Disposables.create()
    }
  }
  
  private func applyFilter(to inputImage: UIImage, completion: @escaping((UIImage) -> Void)) {
    let filter = CIFilter(name: "CICMYKHalftone")
    filter?.setValue(5.0, forKey: kCIInputWidthKey)
    
    if let sourceImage = CIImage(image: inputImage) {
      filter?.setValue(sourceImage, forKey: kCIInputImageKey)
      
      guard let outputImage = filter?.outputImage else {
        return
      }
      
      if let cgImage = self.context.createCGImage(outputImage, from: outputImage.extent) {
        let processedImage = UIImage(cgImage: cgImage, scale: inputImage.scale, orientation: inputImage.imageOrientation)
        
        completion(processedImage)
      }
    }
  }
}
