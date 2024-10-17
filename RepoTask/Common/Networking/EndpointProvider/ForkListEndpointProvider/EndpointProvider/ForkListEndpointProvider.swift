//
//  ForkListEndpointProvider.swift
//  TaskGit
//
//  Created by P K Gumbal on 17/10/24. 09/12/2018.

//

import Foundation

struct ForkListEndpointProvider {
    let requestObject : ForkListRequest
}

extension ForkListEndpointProvider : EndpointProvider{
    typealias Response = ForkListResponse
    typealias Body = ForkListRequest
    typealias Failure = RequestError

    var endpoint: Endpoint<Body>{
        var api : API = .userRepositories
        api.path = ["users", requestObject.queryString]
        return Endpoint(api: api, method: .get, headers: ["Content-Type" : "application/json"], queryParams : nil)
    }
}
