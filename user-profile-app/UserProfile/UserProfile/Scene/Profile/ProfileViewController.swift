//
//  ProfileViewController.swift
//  UserProfile
//
//  Created by Oat on 7/4/2564 BE.
//

import Foundation
import RxDataSources
import Kingfisher

class ProfileViewController: BaseViewController<ProfileViewModelType> {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func setupView() {
    super.setupView()
    
    // TODO: Add RepositoryCell
  }
  
  override func bindInput(viewModel: ProfileViewModelType) {
    rx.methodInvoked(#selector(viewDidLoad))
        .map({(_) in ()})
        .bind(to: viewModel.inputs.viewDidLoad)
        .disposed(by: bag)
  }
  
  override func bindOutput(viewModel: ProfileViewModelType) {
    viewModel.outputs.profile.subscribe { (profile) in
      // map profile UI
    }
    
    viewModel.outputs.repositories.drive(onNext: { (result) in
      // map tableCell
    })
      .disposed(by: bag)
  }
}
