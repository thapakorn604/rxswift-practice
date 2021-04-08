//
//  ProfileUseCase.swift
//  UserProfile
//
//  Created by Oat on 6/4/2564 BE.
//

import Foundation
import RxSwift

enum ProfileEndpoint {
  case getProfile
  case getRepositories
  case getCommitList(String)
}

extension ProfileEndpoint: Request {
  var path: String {
    switch self {
    case .getProfile:
      return "users/defunkt"
    case .getRepositories:
      return "users/defunkt/repos"
    case .getCommitList(let repositoryName):
      return "repos/\(repositoryName)/branches/master"
    }
  }
  
  var method: String {
    "GET"
  }
  
  var body: Codable? {
    return nil
  }
}

class ProfileUseCase: ProfileUseCaseDomain {
  
  private let network: Networkable
  
  init(network: Networkable) {
    self.network = network
  }
  
  func getProfile() -> Observable<Profile> {
    let response: Observable<Profile> = network.call(ProfileEndpoint.getProfile)
    return response
  }
  
  func getRepositories() -> Observable<Repositories> {
    let response: Observable<Repositories> = network.call(ProfileEndpoint.getRepositories)
    return response
  }
  
  func getCommitList(repositoryName: String) -> Observable<Branch> {
    let response: Observable<Branch> = network.call(ProfileEndpoint.getCommitList(repositoryName))
    return response
  }
}
