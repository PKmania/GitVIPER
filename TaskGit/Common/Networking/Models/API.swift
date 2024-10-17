//
//  API.swift
//  TaskGit
//
//  Created by P K Gumbal on 17/10/24.

//

import Foundation

public struct API {
    let baseURL: BaseURL
    var path: [String]
    
    public init(baseURL: BaseURL, path: [String] = []) {
        self.baseURL = baseURL
        self.path = path
    }
}
