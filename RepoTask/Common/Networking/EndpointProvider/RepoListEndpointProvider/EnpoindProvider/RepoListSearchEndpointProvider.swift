//
//  RepoListEndpointProvider.swift
//  TaskGit
//
//  Created by P K Gumbal on 17/10/24. 09/12/2018.

//

import Foundation

struct RepoListSearchEndpointProvider {
    let requestObject : RepoListSearchRequest
    private func getQueryParams()->QueryParams{
        return ["q" : requestObject.queryString, "page" : requestObject.pageNumber, "per_page" : requestObject.perPageElement]
    }
}

extension RepoListSearchEndpointProvider : EndpointProvider{
    typealias Response = RepoListResponse
    
    typealias Body = RepoListSearchRequest
    
    typealias Failure = RequestError
    
    var endpoint: Endpoint<Body> {
        return Endpoint(api: .repositories, method: .get, headers: ["Content-Type" : "application/json"], queryParams: self.getQueryParams())
    }
    
}
