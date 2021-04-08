//
//  CommitList.swift
//  UserProfile
//
//  Created by Oat on 8/4/2564 BE.
//

import Foundation

class CommitListViewController: BaseViewController<CommitListViewModelType> {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func setupView() {
    super.setupView()
  }
  
  override func bindInput(viewModel: CommitListViewModelType) {
    rx.methodInvoked(#selector(viewDidLoad))
    .map({(_) in ()})
    .bind(to: viewModel.inputs.viewDidLoad)
    .disposed(by: bag)
  }
  
  override func bindOutput(viewModel: CommitListViewModelType) {
    print(viewModel.outputs.repositoryInfo.title)
  }
}
