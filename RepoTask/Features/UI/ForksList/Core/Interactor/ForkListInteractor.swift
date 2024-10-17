//
//  ForkListInteractor.swift
//  TaskGit
//
//  Created by P K Gumbal on 17/10/24. 09/12/2018.

//

import Foundation

protocol ForkListInteractor {
    var forkListServices : ForkListServices{ get }
    var presenter : ForkListInteractorToPresenterDelegate!{ get set}
}

class ForkListInteractorImp : ForkListInteractor{
    var forkListServices: ForkListServices
    weak var presenter: ForkListInteractorToPresenterDelegate!

    
    init(forkListServices : ForkListServices) {
        self.forkListServices = forkListServices
    }
    
    private func getForksList(queryString : String){
        self.forkListServices.getForksList(queryString : queryString) { [weak self] (result) in
            guard let `self` = self else { return }
            let forkListDTO = self.preapreDataFromForkListRequest(result: result)
            self.presenter.didForkListFetched(forkListDTO: forkListDTO)
        }
    }
    
    private func preapreDataFromForkListRequest(result : ServicesResult<ForkListResponse>)->ForkListDTO{
        var forkListDTO : ForkListDTO!
        switch result {
        case .success(let data):
            
            forkListDTO = ForkListDTO(owners: data, isError: false, errorMessage: "", showMore: false)
        case .error(let errorMessage):
            forkListDTO = ForkListDTO(owners: nil, isError: true, errorMessage: errorMessage, showMore: false)
            
        }
        return forkListDTO
    }
    
    
}

extension ForkListInteractorImp : ForkListPresenterToInteractorDelegate{
   
    
    func fetchForksList(queryString : String) {
   
        self.getForksList(queryString: queryString)
    }
}
