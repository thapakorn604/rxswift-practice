//
//  RepositoryViewModel.swift
//  UserProfile
//
//  Created by Oat on 7/4/2564 BE.
//

import Foundation

class RepositoryViewModel {
  var title: String
  var description: String
  var language: String
  var stars: String
  var commits: String
  
  init(repository: Repository) {
    self.title = repository.fullName
    self.description = repository.description ?? ""
    self.language = repository.language ?? ""
    self.stars = NumberFormatter.shared.formatNumber(number: repository.stargazersCount)
    self.commits = NumberFormatter.shared.formatNumber(number: repository.size)
  }
}
