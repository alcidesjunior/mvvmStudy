//
//  MoviesViewModel.swift
//  MVVMStudy
//
//  Created by Alcides Junior on 25/01/20.
//  Copyright © 2020 Alcides Junior. All rights reserved.
//


import Foundation

struct MoviesViewModel{
    
    var movies: Movie
    
    init(movies: Movie){
        self.movies = movies
    }
    
    func moviesCount()->Int{
        return self.movies.results.count
    }
    
    func fetchAllResults()->[Results]{
        return self.movies.results
    }
    
    func result(_ id: Int = 0)->Results{
        return fetchAllResults()[id]
    }
}
