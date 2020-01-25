//
//  NetworkErrpr.swift
//  MVVMStudy
//
//  Created by Alcides Junior on 24/01/20.
//  Copyright © 2020 Alcides Junior. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case tokenInvalid
    case unknown
    case noJSONData
}
