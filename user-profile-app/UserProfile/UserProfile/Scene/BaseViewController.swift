//
//  BaseViewController.swift
//  UserProfile
//
//  Created by Oat on 5/4/2564 BE.
//

import UIKit
import RxSwift
import RxCocoa

class BaseViewController<ViewModel>: UIViewController, UIGestureRecognizerDelegate {
  
  let bag = DisposeBag()
  var viewModel: ViewModel!
  var disableBackSwipe: Bool = false
  
  override func loadView() {
    super.loadView()
    setupView()
    bindOutput(viewModel: viewModel)
    bindInput(viewModel: viewModel)
  }
  
  func bindViewModel(_ viewModel: ViewModel) {
    self.viewModel = viewModel
  }
  
  func setupView() {}
  
  func bindInput(viewModel: ViewModel) {}
  
  func bindOutput(viewModel: ViewModel) {}
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    return .portrait
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if #available(iOS 13.0, *) {
      overrideUserInterfaceStyle = .light
    }
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.interactivePopGestureRecognizer?.delegate = self
  }
  
  func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
    if gestureRecognizer.isEqual(navigationController?.interactivePopGestureRecognizer) {
      
      if disableBackSwipe {
        return false
      }
      
      return (navigationController?.viewControllers.count ?? 0) > 1
    }
    return false
  }
}
