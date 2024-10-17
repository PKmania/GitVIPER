//
//  RequestError.swift
//  TaskGit
//
//  Created by P K Gumbal on 17/10/24.

//

import Foundation

import Foundation

public struct RequestError: DTO, Error {
    let statusCode: Int?
    let error: String?
    let message: String?
    
    var localizedDescription: String {
        return message ?? "Something unexpected"
    }
}
