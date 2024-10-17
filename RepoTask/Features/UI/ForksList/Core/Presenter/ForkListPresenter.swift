//
//  ForkListPresenter.swift
//  TaskGit
//
//  Created by P K Gumbal on 17/10/24. 09/12/2018.

//

import Foundation

protocol ForkListPresenter : class {
    var forkListDTO : ForkListDTO? { get }
    
    var view : ForkListPresenterToViewDelegate!{ get}
    var interactor : ForkListPresenterToInteractorDelegate!{ get set }
    var router : ForkListPresenterToRouterDelagate!{ get set}


    func title(for: Int) -> String
    func numberOfRows()->Int
    func heightForRow(at index : Int)->Int

   
}

class ForkListPresenterImp : ForkListPresenter{
    
    weak var view: ForkListPresenterToViewDelegate!
    var interactor: ForkListPresenterToInteractorDelegate!
    var router: ForkListPresenterToRouterDelagate!
    
  
    var forkListDTO: ForkListDTO?

   
    
  

    var sections: Int { return 2 }

    init(view: ForkListPresenterToViewDelegate) {
        self.view = view
       
    }

    func title(for section: Int) -> String { section == 0 ? "Owner" : "Forks" }
    
    func heightForRow(at index: Int) -> Int {
        return 160
    }
    
    func numberOfRows() -> Int {
//        var rowCount = 0
//
//        guard let forkListDTO = forkListDTO else { return rowCount }
//
//        if(section == 1){
//            rowCount = (forkListDTO.showMore) ? forkListDTO.owners.count + 1: forkListDTO.owners.count
//        } else {
//            rowCount = 1
//        }
        if let list = self.forkListDTO {
            return 1
        }else {
            return 0
        }
        
    }
    
    func willShowMore() -> Bool {
        guard let forkListDTO = self.forkListDTO else { return false }
        return forkListDTO.showMore
    }
 
    
    private func getForksList(queryString : String){
        self.interactor.fetchForksList(queryString : queryString)
    }
}

extension ForkListPresenterImp : ForkListViewToPresenterDelegate{
    func viewDidLoad() {
        view.startAnimatingLoader()
      
        
    }
    
    func didTapOnRow(of section:Int, at index: Int) {
        didTapOnRowHandler(of: section, at: index)
    }
    func search(queryString: String) {
        
        self.getForksList(queryString: queryString)
    }
    
    private func didTapOnRowHandler(of section:Int, at index: Int) {
        let own = Owner(login: self.forkListDTO?.owners?.login, id: self.forkListDTO?.owners?.id, avatarURL: self.forkListDTO?.owners?.avatarURL, publicRepos: self.forkListDTO?.owners?.publicRepos)
        router.pushToRouterScreen(owner: own)
//        if section == 0 {
//            router.pushToRouterScreen(owner: owner)
//        } else {
//            if(index == (numberOfForks)){
//                showMoreRepositories()
//            } else {
//                guard let owner = forkListDTO?.owners[index] else {
//                    view.showErrorAlert(with: "Error", message: somethingUnexpectedError)
//                    return
//                }
//                router.pushToRouterScreen(owner: owner)
//            }
//        }

    }
    
    private func showMoreRepositories(){
    
    }
    
    
}

extension ForkListPresenterImp : ForkListInteractorToPresenterDelegate{
    func didForkListFetched(forkListDTO: ForkListDTO) {
        self.didForkListFetchedHandler(forkListDTO: forkListDTO)
    }
    
    private func didForkListFetchedHandler(forkListDTO: ForkListDTO){
        self.view.stopAnimatingLoader()
        
        if(forkListDTO.isError){
            //shwoing error
//            self.forkListFetchedErrorHandler(errorMessage: forkListDTO.errorMessage)
            view.showNoResultFoundAlert()
        }else {
            self.forkListFetchedSuccessfullHandler(forkListDTO : forkListDTO)
        }
    }
    
    private func forkListFetchedErrorHandler(errorMessage : String){
        view.showErrorAlert(with: "Request Failed", message: errorMessage)
    }
    
    private func forkListFetchedSuccessfullHandler(forkListDTO: ForkListDTO){
        if(self.willShowMore()){
            self.didForkListFetchedwillShowMoreHandler(forkListDTO: forkListDTO)
        }else{
            self.forkListDTO = forkListDTO
        }
        self.view.reloadData()
    }
    
    private func didForkListFetchedwillShowMoreHandler(forkListDTO: ForkListDTO){
        
        var owners =  self.forkListDTO?.owners
//        owners!.append(contentsOf: forkListDTO.owners)
//        self.forkListDTO = forkListDTO
//        self.forkListDTO?.owners = owners!
    }
    
}
