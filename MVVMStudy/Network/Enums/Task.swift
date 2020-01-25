//
//  Task.swift
//  MVVMStudy
//
//  Created by Alcides Junior on 24/01/20.
//  Copyright © 2020 Alcides Junior. All rights reserved.
//

import Foundation

typealias Parameters = [String: Any]

enum Task{
    case requestPlain
    case requestParameters(Parameters)
}
