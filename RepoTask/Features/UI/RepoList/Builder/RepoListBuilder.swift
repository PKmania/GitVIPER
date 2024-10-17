//
//  RepoListBuilder.swift
//  TaskGit
//
//  Created by P K Gumbal on 17/10/24. 10/12/2018.

//

import Foundation
import UIKit

protocol RepoListBuilder {
    func build(viewType: RepoListType, owner: Owner?) -> UIViewController
}

class RepoListBuilderImp : RepoListBuilder{
   
    var interactor : ( RepoListPresenterToInteractorDelegate & RepoListInteractor )!
    var presenter : (RepoListPresenter & RepoLisViewToPresenterDelegate & RepoListInteractorToPresenterDelegate)!
    var view : (RepoListPresenterToViewDelegate & RepoListViewController )!
    var router : (RepoListPresenterToRouterDelagate)!
    
    func build(viewType: RepoListType, owner: Owner?) -> UIViewController {
       
        registrInteractor()
        registerView()
        registerPresenter(viewType: viewType, owner: owner)
        registerRouter(repoViewController: self.view)
        
        view.presenter = presenter
        presenter.interactor = interactor
        interactor.presenter = presenter
        presenter.router = self.router
        
        return view
    }
    
    private func registrInteractor(){
        let services = RepoListServicesImp(networkManager: AlamofireManager.shared)
        self.interactor = RepoListInteractorImp(repoListServices: services)
    }
    
    private func registerView(){
        let repoViewController: RepoListViewController = UIStoryboard(storyboard: .main).instantiateViewController()
        self.view = repoViewController
        
    }
    
    private func registerPresenter(viewType: RepoListType, owner: Owner?){
        self.presenter = RepoListPresenterImp(view: view, viewType: viewType, owner: owner)

    }
    private func registerRouter(repoViewController : UIViewController){
        router = RepoListRouterImp(repoListViewController: repoViewController)
    }
    
}
