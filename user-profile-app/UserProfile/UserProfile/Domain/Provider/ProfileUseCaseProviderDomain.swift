//
//  ProfileUseCaseProviderDomain.swift
//  UserProfile
//
//  Created by Oat on 7/4/2564 BE.
//

import Foundation

protocol ProfileUseCaseProviderDomain {
  func makeProfileUseCase() -> ProfileUseCase
}
