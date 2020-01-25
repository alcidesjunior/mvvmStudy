//
//  URLSessionProtocol.swift
//  MVVMStudy
//
//  Created by Alcides Junior on 24/01/20.
//  Copyright © 2020 Alcides Junior. All rights reserved.
//

import Foundation

protocol URLSessionProtocol {
    typealias DataTaskResult = (Data?, URLResponse?, Error?) -> ()
    func dataTask(request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTask
}
