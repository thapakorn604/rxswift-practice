//
//  ProfileUseCaseProvider.swift
//  UserProfile
//
//  Created by Oat on 7/4/2564 BE.
//

import Foundation

final class ProfileUseCaseProvider: ProfileUseCaseProviderDomain {
  private let mainNetwork: Networkable
  
  init(mainNetwork: Networkable) {
    self.mainNetwork = mainNetwork
  }
  
  func makeProfileUseCase() -> ProfileUseCase {
    return ProfileUseCase(network: mainNetwork)
  }
}
