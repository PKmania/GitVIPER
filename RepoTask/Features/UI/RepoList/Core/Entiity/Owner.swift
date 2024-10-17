//
//  Owner.swift
//  TaskGit
//
//  Created by P K Gumbal on 17/10/24. 09/12/2018.

//

import Foundation


struct Owner: Codable {
    
    let login: String?
    let id: Int?
    let avatarURL: String?
    let publicRepos : Int?
    
    enum CodingKeys: String, CodingKey {
        case login, id
        case avatarURL = "avatar_url"
        case publicRepos = "public_repos"
    }
}
