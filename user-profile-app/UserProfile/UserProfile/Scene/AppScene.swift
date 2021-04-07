//
//  Scene.swift
//  UserProfile
//
//  Created by Oat on 5/4/2564 BE.
//

import Foundation
import UIKit

enum AppScene {
  case profile(ProfileViewModelType)
  // TODO: CommitList
}

extension AppScene: SceneProtocol {
  var viewController: UIViewController {
    switch self {
    case let .profile(viewModel):
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let viewController = storyboard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
      viewController.viewModel = viewModel
      return viewController
    }
  }
}
