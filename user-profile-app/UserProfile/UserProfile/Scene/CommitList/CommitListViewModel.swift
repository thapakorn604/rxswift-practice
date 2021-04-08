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
  var commit: Driver<CommitViewModel> { get }
}

protocol CommitListViewModelType {
  var inputs: CommitListViewModelInput { get }
  var outputs: CommitListViewModelOutput { get }
}

class CommitListViewModel: CommitListViewModelInput, CommitListViewModelOutput, CommitListViewModelType {
  var viewDidLoad: PublishRelay<Void> = .init()
  
  var repositoryInfo: RepositoryViewModel
  var commit: Driver<CommitViewModel>
  
  private let bag: DisposeBag = DisposeBag()
  
  var inputs: CommitListViewModelInput { return self }
  var outputs: CommitListViewModelOutput { return self }
  
  init(repository: RepositoryViewModel, provider: ProfileUseCaseProviderDomain) {
    let profileUseCase: ProfileUseCase = provider.makeProfileUseCase()
    repositoryInfo = repository
    
    commit = viewDidLoad.flatMapLatest { () -> Observable<Branch> in
      profileUseCase.getCommitList(repositoryName: repository.title)
    }.map({ (branch) -> CommitViewModel in
      return CommitViewModel.init(branch: branch)
    }).asDriver(onErrorJustReturn: CommitViewModel.init())
  }
}
