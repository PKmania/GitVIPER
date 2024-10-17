//
//  API+Extensions.swift
//  TaskGit
//
//  Created by P K Gumbal on 17/10/24.

//

import Foundation

extension API {
    static let repositories = API(baseURL: .baseURL, path: ["search", "repositories"])
    static var userRepositories = API(baseURL: .baseURL)
    static let userAuthentication = API(baseURL: .baseURL, path: ["user"])
    static let forks = API(baseURL: .baseURL)
}
