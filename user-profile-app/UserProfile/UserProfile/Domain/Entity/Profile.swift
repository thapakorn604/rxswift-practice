// Generated with quicktype
// For more options, try https://app.quicktype.io

import Foundation

struct Profile: Codable {
  let login: String
  let id: Int
  let nodeID, avatarURL, gravatarID, url: String
  let htmlURL, followersURL, followingURL, gistsURL: String
  let starredURL, subscriptionsURL, organizationsURL, reposURL: String
  let eventsURL, receivedEventsURL, type: String
  let siteAdmin: Bool
  let name: String
  let company: String?
  let blog: String
  let location, email, hireable: String?
  let bio: String
  let twitterUsername: String?
  let publicRepos, publicGists, followers, following: Int
  let createdAt, updatedAt: String
  
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
    case name, company, blog, location, email, hireable, bio
    case twitterUsername = "twitter_username"
    case publicRepos = "public_repos"
    case publicGists = "public_gists"
    case followers, following
    case createdAt = "created_at"
    case updatedAt = "updated_at"
  }
}

