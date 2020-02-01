//
//  MoviesViewModel.swift
//  MVVMStudy
//
//  Created by Alcides Junior on 25/01/20.
//  Copyright © 2020 Alcides Junior. All rights reserved.
//


import Foundation

class MoviesViewModel {
    
    fileprivate var movies: Movie?
    fileprivate var networkManager = NetWorkManager()
    var changeLoaderState: ((_ visible: Bool) -> Void)?
    
    init(){
        self.fetchAllResults()
    }
    
    func fetchAllResults(){
        changeLoaderState?(true)
        self.networkManager.get(T: Movie.self, service: .popular(apiKey: APIResources.apiKey.rawValue)) {
            switch $0 {
            case .success(let movies):
                self.movies = movies
            case .failure(let error):
                print(error)
            }
            
            self.changeLoaderState?(false)
        }
        
    }
    
    func moviesCount()->Int{
        guard let countMovies = self.movies?.results.count else{return 0}
        return countMovies
    }
    
    func result(_ id: Int = 0)->Results?{
        if let currentResult = self.movies?.results[id]{
            return currentResult
            
        }
        return nil
    }
}
