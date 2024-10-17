//
//  Result.swift
//  TaskGit
//
//  Created by P K Gumbal on 17/10/24.

//

import Foundation

public enum Result<V ,E: Error> {
    case success(V)
    case error(RequestError)
    case failure(E)
}
