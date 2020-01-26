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
    var movieViewModel: MoviesViewModel!
    let movieView = MoviesView()
    
    override func loadView() {
        self.view = movieView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        fetchData()
        
    }

    fileprivate func fetchData(){
        self.manager.get(T: Movie.self, service: .popular(apiKey: "fb36a114c1dd651ad2d0d45ebbabad10")){
            switch $0{
            case .success(let movies):
                DispatchQueue.main.async {
                    self.movieViewModel = MoviesViewModel(movies: movies)
                    self.movieView.movieTableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

