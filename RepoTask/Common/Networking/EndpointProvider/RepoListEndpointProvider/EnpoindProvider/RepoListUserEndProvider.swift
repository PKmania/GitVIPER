//
//  RepoListUserEndProvider.swift
//  TaskGit
//
//  Created by P K Gumbal on 17/10/24. 09/12/2018.

//

import Foundation

struct RepoListUserEndProvider {
    let requestObject : RepoListUserRequest
    
    private func  getQueryParams()->[String : String]{
        return ["page" : requestObject.page, "per_page" : requestObject.perPageNumber]
    }
}

extension RepoListUserEndProvider : EndpointProvider{
    typealias Response = Array<Repository>
    typealias Body = EmptyDTO
    typealias Failure = RequestError
    
    var endpoint: Endpoint<Body>{
        var api : API = .userRepositories
        api.path = ["users", requestObject.userName, "repos"]
        return Endpoint(api: api, method: .get, queryParams : self.getQueryParams())
    }
}
