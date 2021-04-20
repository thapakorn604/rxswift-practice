//
//  PhotoCollectionViewController.swift
//  CameraFilter
//
//  Created by Oat on 20/4/2564 BE.
//

import UIKit
import Photos
import RxSwift

private let reuseIdentifier = "Cell"

class PhotoCollectionViewController: UICollectionViewController {
  
  private var images = [PHAsset]()
  private var selectedPhotoSubject = PublishSubject<UIImage>()
  
  var selectedPhoto: Observable<UIImage> {
    return selectedPhotoSubject.asObservable()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    populatePhotos()
  }
  
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return images.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCollectionViewCell else {
      return UICollectionViewCell()
    }
    
    let asset = self.images[indexPath.row]
    PHImageManager.default().requestImage(for: asset, targetSize: CGSize(width: 128, height: 128), contentMode: .aspectFit, options: nil) { (image, _) in
      
      DispatchQueue.main.async {
        cell.photoImageView.image = image
      }
    }
    return cell
  }
  
  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let selectedAsset = self.images[indexPath.row]
    
    PHImageManager.default().requestImage(for: selectedAsset, targetSize: CGSize(width: 300, height: 300), contentMode: .aspectFit, options: nil) { [weak self] (image, info) in
      guard let info = info else { return }
      
      if let isDegradedImage = info["PHImageResultIsDegradedKey"] as? Bool  {
        if !isDegradedImage {
          if let image = image {
            self?.selectedPhotoSubject.onNext(image)
            self?.dismiss(animated: true, completion: nil)
          }
        }
      }
    }
  }
  
  private func populatePhotos() {
    PHPhotoLibrary.requestAuthorization { [weak self] (status) in
      if status == .authorized {
        // Access photos from library (Permission needed)
        let assets = PHAsset.fetchAssets(with: .image, options: nil)
        
        assets.enumerateObjects { (object, count, stop) in
          self?.images.append(object)
        }
        
        self?.images.reverse()
        
        DispatchQueue.main.async {
          self?.collectionView.reloadData()
        }
      }
    }
  }
}
