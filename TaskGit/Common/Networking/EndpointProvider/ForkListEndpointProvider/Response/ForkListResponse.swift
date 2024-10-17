//
//  ForkListResponse.swift
//  TaskGit
//
//  Created by P K Gumbal on 17/10/24. 09/12/2018.

//

import Foundation

//struct ForkListResponse: DTO {
//    let login: String
//    let id: Int
//    let nodeID: String
//    let avatarURL: String
//    let gravatarID: String
//   
//    let type: String
//    let siteAdmin: Bool
//    let name, company: String
//    let blog: String
//    let location: String
//    let email, hireable, bio, twitterUsername: String?
//    let publicRepos, publicGists, followers, following: Int
//
//    enum CodingKeys: String, CodingKey {
//        case login, id
//        case nodeID = "node_id"
//        case avatarURL = "avatar_url"
//        case gravatarID = "gravatar_id"
//        case type
//        case siteAdmin = "site_admin"
//        case name, company, blog, location, email, hireable, bio
//        case twitterUsername = "twitter_username"
//        case publicRepos = "public_repos"
//        case publicGists = "public_gists"
//        case followers, following
//    }
//}

struct ForkListResponse: DTO {
    let login: String
    let id: Int
    let nodeID: String // Added for decoding node_id
    let avatarURL: String
    let gravatarID: String
    let url, htmlURL, followersURL: String
    let followingURL, gistsURL, starredURL: String
    let subscriptionsURL, organizationsURL, reposURL: String
    let eventsURL: String
    let receivedEventsURL: String
    let type: String
    let siteAdmin: Bool
    let name: String?
    let company: String?
    let blog: String?
    let location: String?
    let email: String?
    let hireable: String?
    let bio: String?
    let twitterUsername: String?
    let publicRepos, publicGists, followers, following: Int
    let createdAt: Date // Added for created_at
    let updatedAt: Date // Added for updated_at

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
        case createdAt = "created_at" // Added
        case updatedAt = "updated_at" // Added
    }
}
