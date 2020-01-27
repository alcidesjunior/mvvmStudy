//
//  ViewCode.swift
//  MVVMStudy
//
//  Created by Alcides Junior on 25/01/20.
//  Copyright © 2020 Alcides Junior. All rights reserved.
//

import Foundation

protocol ViewCode {
    func buildViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
    func setupView()
}

extension ViewCode{
    func setupView(){
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
}
