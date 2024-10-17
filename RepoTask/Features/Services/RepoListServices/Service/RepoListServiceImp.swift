//
//  RepoListServiceImp.swift
//  TaskGit
//
//  Created by P K Gumbal on 17/10/24. 09/12/2018.

//

import Foundation

typealias SearchRepoCompletion = ((ServicesResult<RepoListResponse>) -> Void)
typealias UserRepoCompletion = ((ServicesResult<Array<Repository>>) -> Void)

final class RepoListServicesImp : RepoListServices{
    var networkManager: NetworkManager
    
    init(networkManager : NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getUserRepositories(userName: String, page : Int , perPageNumber : Int , completion: @escaping UserRepoCompletion) {
        let repoRequest = RepoListUserRequest(userName: userName, page: page.toString, perPageNumber: perPageNumber.toString)
        let  repoListUserEndpointProvider = RepoListUserEndProvider(requestObject: repoRequest)
        
        self.networkManager.request(repoListUserEndpointProvider) { [weak self] (result) in
            
            guard let `self` = self else { return }
            completion(self.parseUserResult(result: result))
        }
    }
    
    func getRepositoriesFromSearch(queryString: String, page: Int, perPageNumber: Int, completion: @escaping SearchRepoCompletion) {
        
        let repoRequest = RepoListSearchRequest(queryString: queryString, pageNumber: page.toString, perPageElement: perPageNumber.toString)
        let  repoListEndpointProvider = RepoListSearchEndpointProvider(requestObject: repoRequest)
        self.networkManager.request(repoListEndpointProvider) { [weak self] (result) in
           
            guard let `self` = self else { return }
            completion(self.parseSearchResult(result: result))
        }
    }
    
    private func parseSearchResult(result : NetworkResult<RepoListResponse, RequestError, NetworkError>)->ServicesResult<RepoListResponse>{
       
        var repoResult : ServicesResult<RepoListResponse>!
        
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
    
    private func parseUserResult(result : NetworkResult<Array<Repository>, RequestError, NetworkError>)->ServicesResult<Array<Repository>>{
        
        var repoResult : ServicesResult<Array<Repository>>!
        
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
