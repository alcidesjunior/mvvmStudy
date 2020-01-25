//
//  NetworkResponse.swift
//  MVVMStudy
//
//  Created by Alcides Junior on 24/01/20.
//  Copyright © 2020 Alcides Junior. All rights reserved.
//

import Foundation

enum NetworkResponse<T>{
    case success(T)
    case failure(NetworkError)
}
