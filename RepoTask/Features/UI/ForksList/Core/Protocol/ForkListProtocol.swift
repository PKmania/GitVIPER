//
//  ForkListProtocol.swift
//  Forksitory Finder
//
//  Created by P K Gumbal on 17/10/24. 09/12/2018.

//

import Foundation

import UIKit

protocol ForkListViewToPresenterDelegate : class{
    func viewDidLoad()
    func didTapOnRow(of section:Int, at index: Int)
    func search(queryString: String) 
}

protocol ForkListPresenterToViewDelegate : class{
    func reloadData()
    func startAnimatingLoader()
    func stopAnimatingLoader()
    func showErrorAlert(with title : String, message : String)
    func showNoResultFoundAlert()
}

protocol ForkListPresenterToInteractorDelegate : class {
    func fetchForksList(queryString: String)
}

protocol ForkListPresenterToRouterDelagate : class {
    func pushToRouterScreen(owner: Owner)
}

protocol ForkListInteractorToPresenterDelegate : class{
    func didForkListFetched(forkListDTO : ForkListDTO)
}


protocol ForkListRouterToPresenterDelegate : class{
    func pop()
}
