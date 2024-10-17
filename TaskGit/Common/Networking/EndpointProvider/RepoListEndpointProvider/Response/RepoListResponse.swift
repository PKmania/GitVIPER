//
//  RepoListResponse.swift
//  TaskGit
//
//  Created by P K Gumbal on 17/10/24. 09/12/2018.

//

import Foundation

struct RepoListResponse : DTO {
    let totalCount: Int
    let incompleteResults: Bool
    let items: [Repository]
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}
