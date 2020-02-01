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
    lazy var movieViewModel = MoviesViewModel()
    lazy var movieView = MoviesView()
    
    override func loadView() {
        self.view = movieView
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        print("INIT VIEW CONTROLLER")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        self.movieView.movieTableView.delegate = self
        self.movieView.movieTableView.dataSource = self
        
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let moviesCount = movieViewModel.moviesCount()
        
        return moviesCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.movieView.movieTableView.dequeueReusableCell(withIdentifier: self.movieView.cellID, for: indexPath) as! MovieTableViewCell
        var result = movieViewModel.result(indexPath.item)
        cell.moviesResult = result
        cell.setup()
        return cell
    }
}
