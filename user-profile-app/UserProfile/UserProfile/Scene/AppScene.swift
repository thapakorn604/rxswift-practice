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
  case commitList(CommitListViewModelType)
}

extension AppScene: SceneProtocol {
  var viewController: UIViewController {
    switch self {
    case let .profile(viewModel):
      let storyboard = UIStoryboard(name: Storyboards.main, bundle: .this)
      let viewController = storyboard.instantiateViewController(withIdentifier: ViewControllers.profileViewController) as! ProfileViewController
      viewController.viewModel = viewModel
      return viewController
    case let .commitList(viewModel):
      let storyboard = UIStoryboard(name: Storyboards.main, bundle: .this)
      let viewController = storyboard.instantiateViewController(withIdentifier: ViewControllers.commitListController) as! CommitListViewController
      viewController.viewModel = viewModel
      return viewController
    }
  }
}
