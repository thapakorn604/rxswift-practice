//
//  Coordinator.swift
//  UserProfile
//
//  Created by Oat on 8/4/2564 BE.
//

import UIKit
import RxSwift

public enum TransitionType {
  case modal(SceneProtocol,Bool)
  case dismiss(Bool)
  case push(SceneProtocol,Bool)
  case pop(Bool)
}

public protocol Coordinator {
  @discardableResult
  func transition(type: TransitionType) -> Observable<Void>
}

public class SceneCoordinator: Coordinator {
  
  private weak var window: UIWindow?
  public init(window: UIWindow) {
    self.window = window
  }
  
  @discardableResult
  public func transition(type: TransitionType) -> Observable<Void> {
    
    guard let window = window, let topViewController = UIViewController.topViewController(window: window) else { return .empty() }
    
    let response = PublishSubject<Void>.init()
    switch type {
    case let .modal(scene, animated):
      topViewController.present(scene.viewController, animated: animated) {
        response.onNext(())
      }
    case let .push(scene, animated):
      topViewController.navigationController?.pushViewController(scene.viewController, animated: animated)
    default:
      fatalError()
    }
    
    return response.take(1)
  }
}
