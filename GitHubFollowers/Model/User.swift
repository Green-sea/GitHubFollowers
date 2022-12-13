//
//  User.swift
//  GitHubFollowers
//
//  Created by Ya on 13.12.22.
//

import Foundation

struct User: Codable {
    var login: String
    var avatarUrl: String
    var name: String?
    var location: String
    var bio: String?
    var publicRepos: Int
    var publicGists: Int
    var htmlURL: String
    var following: Int
    var followers: Int
    var createdAt: String
}
