//
//  ForkListServices.swift
//  TaskGit
//
//  Created by P K Gumbal on 17/10/24. 09/12/2018.

//

import Foundation

protocol ForkListServices {
    var networkManager : NetworkManager{ get }
    func getForksList(queryString : String, completion : @escaping ForkListCompletion )

}
