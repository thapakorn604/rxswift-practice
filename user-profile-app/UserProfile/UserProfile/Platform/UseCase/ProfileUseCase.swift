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
}

extension ProfileEndpoint: Request {
  var path: String {
    switch self {
    case .getProfile:
      return "users/defunkt"
    case .getRepositories:
      return "users/defunkt/repos"
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
}
