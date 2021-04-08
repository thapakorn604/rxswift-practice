//
//  CommitViewModel.swift
//  UserProfile
//
//  Created by Oat on 9/4/2564 BE.
//

import Foundation

class CommitViewModel {
  var branchName: String
  var commitMessage: String
  var auther: String
  var commitedDate: String
  var autherAvatarURL: String
  
  init(branch: Branch) {
    self.branchName = branch.name
    self.commitMessage = branch.commit.commit.message
    self.auther = "\(branch.commit.commit.author.name) authored"
    self.commitedDate = "committed on \(DateTimeFormatter.shared.formatDateTime(branch.commit.commit.author.date))"
    self.autherAvatarURL = branch.commit.author.avatarURL
  }
  
  init() {
    self.branchName = "-"
    self.commitMessage = "-"
    self.auther = "-"
    self.commitedDate = "-"
    self.autherAvatarURL = "-"
  }
}
