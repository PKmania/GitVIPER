//
//  NetworkError.swift
//  TaskGit
//
//  Created by P K Gumbal on 17/10/24.

//

import Foundation

public enum NetworkError: Error {
    case requestCreation( String )
    case decoding(String)
    case server(String)
}

