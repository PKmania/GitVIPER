//
//  RepoListServices.swift
//  TaskGit
//
//  Created by P K Gumbal on 17/10/24. 09/12/2018.

//

import Foundation


protocol RepoListServices {
    
    var networkManager : NetworkManager{ get }
    func getUserRepositories(userName : String, page : Int , perPageNumber : Int, completion : @escaping UserRepoCompletion )
    func getRepositoriesFromSearch(queryString : String, page : Int , perPageNumber : Int, completion : @escaping SearchRepoCompletion)
}
