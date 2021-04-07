//
//  ProfileViewModel.swift
//  UserProfile
//
//  Created by Oat on 7/4/2564 BE.
//

import Foundation
import RxCocoa
import RxSwift

protocol ProfileViewModelInput {
  var viewDidLoad: PublishRelay<Void> { get }
  var selectRepository: PublishRelay<Repository> { get }
}

protocol  ProfileViewModelOutput {
  var profile: Observable<Profile> { get }
  var repositories: Driver<[RepositoryViewModel]> { get }
}

protocol ProfileViewModelType {
  var inputs: ProfileViewModelInput { get }
  var outputs: ProfileViewModelOutput { get }
}

class ProfileViewModel: ProfileViewModelInput, ProfileViewModelOutput, ProfileViewModelType {
  var viewDidLoad: PublishRelay<Void> = .init()
  var selectRepository: PublishRelay<Repository> = .init()
  
  var profile: Observable<Profile>
  var repositories: Driver<[RepositoryViewModel]>
  
  private let bag: DisposeBag = DisposeBag()
  
  var inputs: ProfileViewModelInput { return self }
  var outputs: ProfileViewModelOutput { return self }
  
  init(provider: ProfileUseCaseProviderDomain) {
    let profileUseCase: ProfileUseCase = provider.makeProfileUseCase()
    
    profile = viewDidLoad.flatMapLatest { () -> Observable<Profile> in
      profileUseCase.getProfile()
    }
    
    repositories = viewDidLoad.flatMapLatest { () -> Observable<Repositories> in
      profileUseCase.getRepositories()
    }.map({ (repositories) -> [RepositoryViewModel] in
      repositories.map(RepositoryViewModel.init)
    }).asDriver(onErrorJustReturn: [])
  }
}
