//
//  ProfileUseCaseDomain.swift
//  UserProfile
//
//  Created by Oat on 6/4/2564 BE.
//

import Foundation
import RxSwift

protocol ProfileUseCaseDomain {
  func getProfile() -> Observable<Profile>
  func getRepositories() -> Observable<Repositories>
}
