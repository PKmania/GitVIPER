//
//  RepoListInteractor.swift
//  TaskGit
//
//  Created by P K Gumbal on 17/10/24. 09/12/2018.

//

import Foundation



protocol RepoListInteractor {
    var repoListServices : RepoListServices{ get }
    var presenter : RepoListInteractorToPresenterDelegate!{ get set}
}

class RepoListInteractorImp : RepoListInteractor{
    
    var repoListServices: RepoListServices
    
    weak var presenter: RepoListInteractorToPresenterDelegate!
   
    var page : Int = 0
    var perPageNumber = 0
    var userTotalRepo = 0
    init(repoListServices : RepoListServices) {
        self.repoListServices = repoListServices
    }
    
    private func getSearchRepositories(queryString: String, page: Int, perPageNumber: Int) {
        self.repoListServices.getRepositoriesFromSearch(queryString: queryString, page: page, perPageNumber: perPageNumber) { [weak self](result) in
            guard let `self` = self else{ return }
            let repoListDTO = self.preapreDataFromSearchRepoRequest(result: result)
            self.presenter.didRepositoriesFetched(repoListDTO: repoListDTO)
        }
    }
    
    private func getUserRepositories(userName: String, page : Int, perPageNumber : Int) {
        self.repoListServices.getUserRepositories(userName: userName, page: page, perPageNumber: perPageNumber){ [weak self] (result) in
            guard let `self` = self else{ return }
            let repoListDTO = self.preapreDataFromUserRepoRequest(result: result)
            self.presenter.didRepositoriesFetched(repoListDTO: repoListDTO)
        }
    }
    
    private func preapreDataFromUserRepoRequest(result : ServicesResult<Array<Repository>>)->RepoListDTO{
        var repoListDTO : RepoListDTO!
        switch result {
        case .success(let data):
            let shouldShowMore = ((self.perPageNumber) * self.page < self.userTotalRepo) ? true : false
            repoListDTO = RepoListDTO(repositories: data, isError: false, errorMessage: "", showMore: shouldShowMore)
        case .error(let errorMessage):
            repoListDTO = RepoListDTO(repositories: [], isError: true, errorMessage: errorMessage, showMore: false)
            
        }
        return repoListDTO
    }
    
    private func preapreDataFromSearchRepoRequest(result : ServicesResult<RepoListResponse>)->RepoListDTO{
        var repoListDTO : RepoListDTO!
        switch result {
        case .success(let data):
            let shouldShowMore = ((self.perPageNumber) * self.page < data.totalCount) ? true : false
            repoListDTO = RepoListDTO(repositories: data.items, isError: false, errorMessage: "", showMore: shouldShowMore)
        case .error(let errorMessage):
            repoListDTO = RepoListDTO(repositories: [], isError: true, errorMessage: errorMessage, showMore: false)
            
        }
        return repoListDTO
    }
    
}

extension RepoListInteractorImp : RepoListPresenterToInteractorDelegate{
    func fetchUserRepositories(userName : String, page : Int, perPageNumber : Int, totalRepo : Int) {
        self.userTotalRepo = 85
        self.page = page
        self.perPageNumber = perPageNumber
        self.getUserRepositories(userName: userName, page: page, perPageNumber: perPageNumber)
        
    }
    
    func fetchSearchRepositories(queryString: String, page: Int, perPageNumber: Int) {
        self.page = page
        self.perPageNumber = perPageNumber
        self.getSearchRepositories(queryString: queryString, page: page, perPageNumber: perPageNumber)
    }
    
    
}














