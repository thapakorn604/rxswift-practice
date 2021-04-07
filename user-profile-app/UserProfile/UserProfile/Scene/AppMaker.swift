//
//  AppMaker.swift
//  UserProfile
//
//  Created by Oat on 7/4/2564 BE.
//

import Foundation

extension Bundle {
  static let this: Bundle = .init(for: AppMaker.self)
}

public class AppMaker {
  
  private let mainNetwork: Networkable
  
  init(mainNetwork: Networkable) {
    self.mainNetwork = mainNetwork
  }
  
  public func make() -> SceneProtocol {
    
    let viewModel = ProfileViewModel(
      provider: ProfileUseCaseProvider(mainNetwork: mainNetwork)
    )
    
    return AppScene.profile(viewModel)
  }
}
