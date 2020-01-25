//
//  ProviderProtocol.swift
//  MVVMStudy
//
//  Created by Alcides Junior on 24/01/20.
//  Copyright © 2020 Alcides Junior. All rights reserved.
//

import Foundation

protocol ProviderProtocol {
    func request<T>(type: T.Type, service: ServiceProtocol, completion: @escaping (NetworkResponse<T>)->()) where T: Decodable
}
