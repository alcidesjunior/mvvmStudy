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
    lazy var movieView = MoviesView()
    
    override func loadView() {
        self.view = movieView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        self.movieView.movieTableView.delegate = self
        self.movieView.movieTableView.dataSource = self
        fetchData()
        
    }

    fileprivate func fetchData(){
        self.manager.get(T: Movie.self, service: .popular(apiKey: APIResources.apiKey.rawValue)){
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

extension MainViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let moviesCount = movieViewModel?.moviesCount() else{ return 0 }
        return moviesCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.movieView.movieTableView.dequeueReusableCell(withIdentifier: self.movieView.cellID, for: indexPath) as! MovieTableViewCell
        cell.moviesResult = movieViewModel?.result(indexPath.item)
        return cell
    }
}
