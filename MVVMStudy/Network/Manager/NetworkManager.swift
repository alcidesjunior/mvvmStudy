//
//  NetworkManager.swift
//  MVVMStudy
//
//  Created by Alcides Junior on 24/01/20.
//  Copyright © 2020 Alcides Junior. All rights reserved.
//

import Foundation

struct NetWorkManager{
    
    private let sessionProvider = URLSessionProvider()
    
    func get<T: Decodable>(T: T.Type, service: Service, completion: @escaping (Result<T, NetworkError>)->() ){
        sessionProvider.request(type: T.self, service: service) { response in
        switch response {
            case let .success(result):
                completion(.success(result))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
