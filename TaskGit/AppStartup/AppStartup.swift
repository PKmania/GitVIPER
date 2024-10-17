//
//  AppStartup.swift
//  TaskGit
//
//  Created by P K Gumbal on 16/10/24.
//

import UIKit

final class AppStartup {

    static var navigationController: UINavigationController!

    class func start() -> UIViewController {
//        let builder: RepoListBuilder = RepoListBuilderImp()
        let forkListBuilder : ForksListBuilder = ForksListBuilderImp()
        let forkListVC = forkListBuilder.build()
//        let rootViewController = builder.build(viewType: .search, owner: nil)
        AppStartup.navigationController = UINavigationController(rootViewController: forkListVC)
        AppStartup
            .navigationController.makeDefaultSettings()
        return navigationController
        
  
    }

}
