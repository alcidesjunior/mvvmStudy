//
//  MoviesViewModel.swift
//  MVVMStudy
//
//  Created by Alcides Junior on 25/01/20.
//  Copyright © 2020 Alcides Junior. All rights reserved.
//


import Foundation

class MoviesViewModel {
    
    fileprivate var movies:[Results] = []
    fileprivate var networkManager = NetWorkManager()

    fileprivate func fetchAllResults(){
        self.networkManager.get(T: Movie.self, service: .popular(apiKey: APIResources.apiKey.rawValue)) {[weak self] data in
            switch data {
            case .success(let movies):
                self?.movies = movies.results
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    func moviesCount()->Int{
        let rows = self.movies.count
        if rows == 0{
            self.fetchAllResults()
            print("aqui")
        }
        return self.movies.count
    }
    
    func result(_ id: Int = 0)->Results{
       return  self.movies[id]
    }
}
