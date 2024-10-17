//
//  ForksListBuilder.swift
//  TaskGit
//
//  Created by P K Gumbal on 17/10/24. 10/12/2018.

//

import Foundation
import UIKit

protocol ForksListBuilder {
     func build()->UIViewController
}

class ForksListBuilderImp : ForksListBuilder{
    var interactor : ( ForkListPresenterToInteractorDelegate & ForkListInteractor )!
    var presenter : (ForkListPresenter & ForkListViewToPresenterDelegate & ForkListInteractorToPresenterDelegate)!
    var view : (ForkListPresenterToViewDelegate & ForkListViewController )!
    var router : (ForkListPresenterToRouterDelagate)!
    
    func build()->UIViewController{
        
        registrInteractor()
        registerView()
        registerPresenter()
        registerRouter()
        
        self.view.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return self.view
    }
    
    private func registrInteractor(){
        let services = ForkListServicesImp(networkManager: AlamofireManager.shared)
        self.interactor = ForkListInteractorImp(forkListServices: services)
    }
    
    private func registerView(){
        let repoViewController: ForkListViewController =  UIStoryboard(storyboard: .main).instantiateViewController() 
        self.view = repoViewController
        
    }
    
    private func registerPresenter(){
        self.presenter = ForkListPresenterImp(view: self.view)
        
    }
    private func registerRouter(){
        self.router  = ForkListRouterImp(forkViewController: view)
    }
}
