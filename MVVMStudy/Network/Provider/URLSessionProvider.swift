//
//  URLSessionProvider.swift
//  MVVMStudy
//
//  Created by Alcides Junior on 24/01/20.
//  Copyright © 2020 Alcides Junior. All rights reserved.
//

import Foundation

final class URLSessionProvider: ProviderProtocol {
    
    
    private var session: URLSessionProtocol

    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    func request<T>(type: T.Type, service: ServiceProtocol,
                    completion: @escaping (NetworkResponse<T>) -> ()) where T : Decodable {
        
        let request = URLRequest(service: service)
        let task = session.dataTask(request: request, completionHandler: { [weak self] data, response, error in
            let httpResponse = response as? HTTPURLResponse
            self?.handleDataResponse(data: data, response: httpResponse, error: error, completion: completion)
        })
        task.resume()
    }
    
    private func handleDataResponse<T: Decodable>(data: Data?, response: HTTPURLResponse?, error: Error?, completion: (NetworkResponse<T>) -> ()) {
        guard error == nil else { return completion(.failure(.unknown)) }
        guard let response = response else { return completion(.failure(.noJSONData)) }

        switch response.statusCode {
        case 200...299:
            guard let data = data, let model = try? JSONDecoder()
                     .decode(T.self, from: data) else { return completion(.failure(.unknown)) }
            completion(.success(model))
        case 400...499:
            completion(.failure(.tokenInvalid))
        default:
            completion(.failure(.unknown))
        }
    }
}
