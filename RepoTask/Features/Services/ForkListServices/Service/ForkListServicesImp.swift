//
//  ForkListServicesImp.swift
//  TaskGit
//
//  Created by P K Gumbal on 17/10/24. 09/12/2018.

//

import Foundation

typealias ForkListCompletion = ((ServicesResult<ForkListResponse>) -> Void)


final class ForkListServicesImp : ForkListServices{
    
    
    var networkManager: NetworkManager
    
    init(networkManager : NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getForksList(queryString: String, completion : @escaping ForkListCompletion ) {
        
        let forkListRequest = ForkListRequest(queryString: queryString)
        
        let  forkListUserEndpointProvider = ForkListEndpointProvider(requestObject: forkListRequest)
        
        self.networkManager.request(forkListUserEndpointProvider) { [weak self] (result) in
            
            guard let `self` = self else { return }
            let res = self.parseForksResult(result: result)
            completion(res)
        }
    }
    
    private func parseForksResult(result : NetworkResult<ForkListResponse, RequestError, NetworkError>)->ServicesResult<ForkListResponse>{
        
        var repoResult : ServicesResult<ForkListResponse>!
        
        switch result{
        case .success(let data):
            
            repoResult = .success(data)
        case .error(let networkerror):
            repoResult = .error(self.parseNetworkError(error: networkerror))
        case .failure(let failure):
            repoResult = .error(failure.message ?? somethingUnexpectedError)
        }
        return repoResult
    }
    
    
    private func parseNetworkError(error : NetworkError)->String{
        var errorString = ""
        switch error {
        case .requestCreation(let badRequest):
            errorString = badRequest
        case .server(let serverError) :
            errorString = serverError
        case .decoding(let dataError):
            errorString = dataError
        }
        return errorString
    }
    
}
