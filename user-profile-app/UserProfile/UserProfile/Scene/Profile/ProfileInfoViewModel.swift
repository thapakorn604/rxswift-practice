//
//  ProfileInfoViewModel.swift
//  UserProfile
//
//  Created by Oat on 8/4/2564 BE.
//

import Foundation

class ProfileInfoViewModel {
  var profileName: String
  var userName: String
  var bioDescription: String
  var repositoriesCount: String
  var starsCount: String
  var followersCount: String
  var followingCount: String
  var avatarURL: String
  
  init(profile: Profile) {
    self.profileName = profile.name
    self.userName = profile.login
    self.bioDescription = profile.bio
    self.repositoriesCount = NumberFormatter.shared.formatNumber(number: profile.publicRepos)
    self.starsCount = NumberFormatter.shared.formatNumber(number: profile.publicGists)
    self.followersCount = NumberFormatter.shared.formatNumber(number: profile.followers)
    self.followingCount = NumberFormatter.shared.formatNumber(number: profile.following)
    self.avatarURL = profile.avatarURL
  }
  
  init() {
    self.profileName = "-"
    self.userName = "-"
    self.bioDescription = "-"
    self.repositoriesCount = NumberFormatter.shared.formatNumber(number: 0)
    self.starsCount = NumberFormatter.shared.formatNumber(number: 0)
    self.followersCount = NumberFormatter.shared.formatNumber(number: 0)
    self.followingCount = NumberFormatter.shared.formatNumber(number: 0)
    self.avatarURL = ""
  }
}
