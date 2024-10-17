//
//  RepoListViperProtocols.swift
//  TaskGit
//
//  Created by P K Gumbal on 17/10/24. 09/12/2018.

//

import Foundation

protocol RepoLisViewToPresenterDelegate : class{
    func viewDidLoad()
    func search(queryString : String)
    func didTapOnRow(with index : Int)
}

protocol RepoListPresenterToViewDelegate : class{
    func reloadData()
    func scrollTableViewToTop()
    func startAnimatingLoader()
    func stopAnimatingLoader()
    func showNoResultFoundAlert()
    func showErrorAlert(with title : String, message : String)
    func hideSearchBar()
}

protocol RepoListPresenterToInteractorDelegate : class {
    func fetchUserRepositories(userName : String, page : Int, perPageNumber : Int, totalRepo : Int)
    func fetchSearchRepositories(queryString : String, page : Int, perPageNumber : Int)
}

protocol RepoListPresenterToRouterDelagate : class{
    func pushToForkScreen(repository : String, owner: Owner, totalForks : Int)
}

protocol RepoListInteractorToPresenterDelegate : class{
    func didRepositoriesFetched(repoListDTO : RepoListDTO)
}


protocol RepoListRouterToPresenterDelegate : class{
    
}
