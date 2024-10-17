//
//  NetworkManager.swift
//  TaskGit
//
//  Created by P K Gumbal on 17/10/24.

//

import Foundation

protocol NetworkManager {
    static var shared : NetworkManager { get }
    
    func request<E: EndpointProvider>(_ endpointProvider: E,
                                      completion: @escaping ((NetworkResult<E.Response, E.Failure, NetworkError>) -> Void))
    
}
