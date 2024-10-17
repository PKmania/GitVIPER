//
//  RepoListRouter.swift
//  TaskGit
//
//  Created by P K Gumbal on 17/10/24. 09/12/2018.

//

import Foundation
import UIKit

protocol RepoListRouter { var repoListViewController: UIViewController { get } }

class RepoListRouterImp : RepoListRouter{
    var repoListViewController: UIViewController

    init(repoListViewController: UIViewController) {
        self.repoListViewController = repoListViewController
    }
}

extension RepoListRouterImp : RepoListPresenterToRouterDelagate{
    func pushToForkScreen(repository: String, owner: Owner, totalForks: Int){
//        let forkListBuilder : ForksListBuilder = ForksListBuilderImp()
//        let forkListVC = forkListBuilder.build(repository: repository, owner: owner, totalForks: totalForks)
//        repoListViewController.navigationController?.pushViewController(forkListVC, animated: true)
    }
}
