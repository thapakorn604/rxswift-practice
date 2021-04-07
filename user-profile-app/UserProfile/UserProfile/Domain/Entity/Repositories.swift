
// Generated with quicktype
// For more options, try https://app.quicktype.io

import Foundation

typealias Repositories = [Repository]

struct Repository: Codable {
  let id: Int
  let nodeID, name, fullName: String
  let repositoryPrivate: Bool
  let owner: Owner
  let htmlURL: String
  let description: String?
  
  let fork: Bool
  let url, forksURL, keysURL, collaboratorsURL: String
  let teamsURL, hooksURL, issueEventsURL, eventsURL: String
  let assigneesURL, branchesURL, tagsURL, blobsURL: String
  let gitTagsURL, gitRefsURL, treesURL, statusesURL: String
  let languagesURL, stargazersURL, contributorsURL, subscribersURL: String
  let subscriptionURL, commitsURL, gitCommitsURL, commentsURL: String
  let issueCommentURL, contentsURL, compareURL, mergesURL: String
  let archiveURL, downloadsURL, issuesURL, pullsURL: String
  let milestonesURL, notificationsURL, labelsURL, releasesURL: String
  let deploymentsURL, createdAt, updatedAt, pushedAt: String
  let gitURL, sshURL, cloneURL, svnURL: String
  let homepage: String?
  let size, stargazersCount, watchersCount: Int
  let language: String?
  let hasIssues, hasProjects, hasDownloads, hasWiki: Bool
  let hasPages: Bool
  let forksCount: Int
  let mirrorURL: String?
  let archived, disabled: Bool
  let openIssuesCount: Int
  let license: License?
  let forks, openIssues, watchers: Int
  let defaultBranch: String
  
  enum CodingKeys: String, CodingKey {
    case id
    case nodeID = "node_id"
    case name
    case fullName = "full_name"
    case repositoryPrivate = "private"
    case owner
    case htmlURL = "html_url"
    case description, fork, url
    case forksURL = "forks_url"
    case keysURL = "keys_url"
    case collaboratorsURL = "collaborators_url"
    case teamsURL = "teams_url"
    case hooksURL = "hooks_url"
    case issueEventsURL = "issue_events_url"
    case eventsURL = "events_url"
    case assigneesURL = "assignees_url"
    case branchesURL = "branches_url"
    case tagsURL = "tags_url"
    case blobsURL = "blobs_url"
    case gitTagsURL = "git_tags_url"
    case gitRefsURL = "git_refs_url"
    case treesURL = "trees_url"
    case statusesURL = "statuses_url"
    case languagesURL = "languages_url"
    case stargazersURL = "stargazers_url"
    case contributorsURL = "contributors_url"
    case subscribersURL = "subscribers_url"
    case subscriptionURL = "subscription_url"
    case commitsURL = "commits_url"
    case gitCommitsURL = "git_commits_url"
    case commentsURL = "comments_url"
    case issueCommentURL = "issue_comment_url"
    case contentsURL = "contents_url"
    case compareURL = "compare_url"
    case mergesURL = "merges_url"
    case archiveURL = "archive_url"
    case downloadsURL = "downloads_url"
    case issuesURL = "issues_url"
    case pullsURL = "pulls_url"
    case milestonesURL = "milestones_url"
    case notificationsURL = "notifications_url"
    case labelsURL = "labels_url"
    case releasesURL = "releases_url"
    case deploymentsURL = "deployments_url"
    case createdAt = "created_at"
    case updatedAt = "updated_at"
    case pushedAt = "pushed_at"
    case gitURL = "git_url"
    case sshURL = "ssh_url"
    case cloneURL = "clone_url"
    case svnURL = "svn_url"
    case homepage, size
    case stargazersCount = "stargazers_count"
    case watchersCount = "watchers_count"
    case language
    case hasIssues = "has_issues"
    case hasProjects = "has_projects"
    case hasDownloads = "has_downloads"
    case hasWiki = "has_wiki"
    case hasPages = "has_pages"
    case forksCount = "forks_count"
    case mirrorURL = "mirror_url"
    case archived, disabled
    case openIssuesCount = "open_issues_count"
    case license, forks
    case openIssues = "open_issues"
    case watchers
    case defaultBranch = "default_branch"
  }
}

struct License: Codable {
  let key, name, spdxID: String
  let url: String?
  let nodeID: String
  
  enum CodingKeys: String, CodingKey {
    case key, name
    case spdxID = "spdx_id"
    case url
    case nodeID = "node_id"
  }
}

struct Owner: Codable {
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
