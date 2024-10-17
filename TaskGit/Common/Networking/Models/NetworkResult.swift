//
//  NetworkResult.swift
//  TaskGit
//
//  Created by P K Gumbal on 17/10/24.

//


import Foundation

public enum NetworkResult<V, W, E: Error> {
    case success(V)
    case failure(W)
    case error(E)
}
