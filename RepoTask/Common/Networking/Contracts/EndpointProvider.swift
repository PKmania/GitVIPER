//
//  EndpointProvider.swift
//  TaskGit
//
//  Created by P K Gumbal on 17/10/24.

//

import Foundation

protocol EndpointProvider {
    associatedtype Response: DTO
    associatedtype Body: DTO
    associatedtype Failure: DTO
    
    var endpoint: Endpoint<Body> { get }
}
