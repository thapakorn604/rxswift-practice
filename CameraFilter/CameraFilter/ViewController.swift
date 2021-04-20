//
//  ViewController.swift
//  CameraFilter
//
//  Created by Oat on 20/4/2564 BE.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
  
  @IBOutlet weak var previewImageView: UIImageView!
  @IBOutlet weak var applyButton: UIButton!
  
  let disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let navigationController = segue.destination as? UINavigationController,
          let photoCollectionViewController = navigationController.viewControllers.first as? PhotoCollectionViewController else {
      return
    }
    
    photoCollectionViewController.selectedPhoto.subscribe(onNext: { [weak self] (image) in
      DispatchQueue.main.async {
        self?.updateUI(with: image)
      }
    })
    .disposed(by: disposeBag)
  }
  
  private func updateUI(with image: UIImage) {
    self.previewImageView.image = image
    self.applyButton.isHidden = false
  }
  
  @IBAction func didTapApplyFilter(_ sender: Any) {
    guard let sourceImage = self.previewImageView.image else {
      return
    }
    
    FilterService().applyFilter(to: sourceImage)
      .subscribe(onNext: { (filteredImage) in
        DispatchQueue.main.async {
          self.previewImageView.image = filteredImage
        }
      })
      .disposed(by: disposeBag)
  }
}

