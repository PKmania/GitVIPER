//
//  ForkListRouter.swift
//  TaskGit
//
//  Created by P K Gumbal on 17/10/24. 09/12/2018.

//

import Foundation
import UIKit

protocol ForkListRouter {

}

class ForkListRouterImp : ForkListRouter {
    var forkViewController: UIViewController

    init(forkViewController: UIViewController) {
        self.forkViewController = forkViewController
    }
}

extension ForkListRouterImp : ForkListPresenterToRouterDelagate{
    func pushToRouterScreen(owner: Owner) {
        let repoViewController = RepoListBuilderImp().build(viewType: .user, owner: owner)
        forkViewController.navigationController?.pushViewController(repoViewController, animated: true)
    }

}


