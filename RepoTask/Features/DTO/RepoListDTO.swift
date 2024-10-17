//
//  RepoListDTO.swift
//  TaskGit
//
//  Created by P K Gumbal on 17/10/24. 09/12/2018.

//

import Foundation

struct RepoListDTO {
    var repositories : [Repository]
    var isError : Bool
    var errorMessage : String
    var showMore : Bool
}
