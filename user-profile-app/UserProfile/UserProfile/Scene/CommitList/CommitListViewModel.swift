//
//  CommitListViewModel.swift
//  UserProfile
//
//  Created by Oat on 8/4/2564 BE.
//

import Foundation
import RxCocoa
import RxSwift

protocol CommitListViewModelInput {
  var viewDidLoad: PublishRelay<Void> { get }
}

protocol  CommitListViewModelOutput {
  //  var profileInfo: Driver<ProfileInfoViewModel> { get }
  var repositoryInfo: RepositoryViewModel { get }
}

protocol CommitListViewModelType {
  var inputs: CommitListViewModelInput { get }
  var outputs: CommitListViewModelOutput { get }
}

class CommitListViewModel: CommitListViewModelInput, CommitListViewModelOutput, CommitListViewModelType {
  
  var viewDidLoad: PublishRelay<Void> = .init()
  
  var repositoryInfo: RepositoryViewModel
  
  private let bag: DisposeBag = DisposeBag()
  
  var inputs: CommitListViewModelInput { return self }
  var outputs: CommitListViewModelOutput { return self }
  
  init(repository: RepositoryViewModel, provider: ProfileUseCaseProviderDomain) {
    //    let profileUseCase: ProfileUseCase = provider.makeProfileUseCase()
    repositoryInfo = repository
  }
}
