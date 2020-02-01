//
//  MoviesViewModel.swift
//  MVVMStudy
//
//  Created by Alcides Junior on 25/01/20.
//  Copyright © 2020 Alcides Junior. All rights reserved.
//


import Foundation

class MoviesViewModel {
    //code-review: é melhor usar private. Usar fileprivate somente se for necessário. Isso se aplica a todos os filesprivates que tu usou.
    fileprivate var movies: Movie?
    fileprivate var networkManager = NetWorkManager()
    var changeLoaderState: ((_ visible: Bool) -> Void)? //code-review: Não entendi o que isto faz.
    
    init(){
        //code-review: Por que fazer o fetch no init? Poderia ser feito na ViewController.
        //Tu ta dando fetch antes da view controller ser carregada. É estranho.
        //Coloquei um print para os inits para tu ver. Primeiro ocorre o init na view model dps na view controller.
        //Tu vai ter que refatorar o código quando for colocar o fetch na view controller.
        self.fetchAllResults()
        print("INIT VIEW MODEL")
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
