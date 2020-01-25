//
//  ViewController.swift
//  MVVMStudy
//
//  Created by Alcides Junior on 24/01/20.
//  Copyright © 2020 Alcides Junior. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let manager = NetWorkManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        manager.get(T: Movie.self, service: .popular(apiKey: APIResources.apiKey.rawValue) ) { result in
            switch result{
            case .success(let movies):
                print(movies.results)
            case .failure(let error):
                print(error)
            }
        }
    }


}

