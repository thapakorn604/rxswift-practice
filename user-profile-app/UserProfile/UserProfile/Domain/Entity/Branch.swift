//
//  CommitList.swift
//  UserProfile
//
//  Created by Oat on 8/4/2564 BE.
//

import Foundation

struct Branch: Codable {
  let name: String
  let commit: BranchCommit
  let links: Links
  let protected: Bool
  let protection: Protection
  let protectionURL: String
  
  enum CodingKeys: String, CodingKey {
    case name, commit
    case links = "_links"
    case protected, protection
    case protectionURL = "protection_url"
  }
}

struct BranchCommit: Codable {
  let sha, nodeID: String
  let commit: Commit
  let url, htmlURL, commentsURL: String
  let author, committer: Author
  let parents: [Parent]
  
  enum CodingKeys: String, CodingKey {
    case sha
    case nodeID = "node_id"
    case commit, url
    case htmlURL = "html_url"
    case commentsURL = "comments_url"
    case author, committer, parents
  }
}

struct Author: Codable {
  let login: String
  let id: Int
  let nodeID, avatarURL, gravatarID, url: String
  let htmlURL, followersURL, followingURL, gistsURL: String
  let starredURL, subscriptionsURL, organizationsURL, reposURL: String
  let eventsURL, receivedEventsURL, type: String
  let siteAdmin: Bool
  
  enum CodingKeys: String, CodingKey {
    case login, id
    case nodeID = "node_id"
    case avatarURL = "avatar_url"
    case gravatarID = "gravatar_id"
    case url
    case htmlURL = "html_url"
    case followersURL = "followers_url"
    case followingURL = "following_url"
    case gistsURL = "gists_url"
    case starredURL = "starred_url"
    case subscriptionsURL = "subscriptions_url"
    case organizationsURL = "organizations_url"
    case reposURL = "repos_url"
    case eventsURL = "events_url"
    case receivedEventsURL = "received_events_url"
    case type
    case siteAdmin = "site_admin"
  }
}

struct Commit: Codable {
  let author, committer: CommitAuthor
  let message: String
  let tree: Tree
  let url: String
  let commentCount: Int
  let verification: Verification
  
  enum CodingKeys: String, CodingKey {
    case author, committer, message, tree, url
    case commentCount = "comment_count"
    case verification
  }
}

struct CommitAuthor: Codable {
  let name, email, date: String
}

struct Tree: Codable {
  let sha, url: String
}

struct Verification: Codable {
  let verified: Bool
  let reason: String
  let signature, payload: String?
}

struct Parent: Codable {
  let sha, url, htmlURL: String
  
  enum CodingKeys: String, CodingKey {
    case sha, url
    case htmlURL = "html_url"
  }
}

struct Links: Codable {
  let purpleSelf, html: String
  
  enum CodingKeys: String, CodingKey {
    case purpleSelf = "self"
    case html
  }
}

struct Protection: Codable {
  let enabled: Bool
  let requiredStatusChecks: RequiredStatusChecks
  
  enum CodingKeys: String, CodingKey {
    case enabled
    case requiredStatusChecks = "required_status_checks"
  }
}

struct RequiredStatusChecks: Codable {
  let enforcementLevel: String
  let contexts: [String?]
  
  enum CodingKeys: String, CodingKey {
    case enforcementLevel = "enforcement_level"
    case contexts
  }
}
