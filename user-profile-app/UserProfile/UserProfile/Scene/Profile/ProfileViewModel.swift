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
  
}

protocol  ProfileViewModelOutput {
  
}

protocol ProfileViewModelType {
  var inputs: ProfileViewModelInput { get }
  var outputs: ProfileViewModelOutput { get }
}

class ProfileViewModel: ProfileViewModelInput, ProfileViewModelOutput, ProfileViewModelType {
  
  private let bag: DisposeBag = DisposeBag()
  
  var inputs: ProfileViewModelInput { return self }
  var outputs: ProfileViewModelOutput { return self }
  
  init() {
    
  }
}
