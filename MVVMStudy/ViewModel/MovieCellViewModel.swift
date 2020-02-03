//
//  MovieCellViewModel.swift
//  MVVMStudy
//
//  Created by Alcides Junior on 30/01/20.
//  Copyright © 2020 Alcides Junior. All rights reserved.
//

import UIKit

class MovieCellViewModel{
    
    private let movie: Results?
    
    init(movie: Results?){
        self.movie = movie
    }
    
    fileprivate func fullPath(originalPath: String, urlPart: String)->String{
        return "\(originalPath)\(urlPart)"
    }
    
    func labelValue()->String{
        return self.movie?.originalTitle ?? "Empty"
    }
    
    func imagePath()->String{
        if let path = self.movie?.posterPath{
            return fullPath(originalPath: APIResources.baseImageUrl.rawValue, urlPart: path)
        }
        return "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQuRjuEz_pIx5qgi2jfrzKNzb-ePk0FDZ1mj3W862v3sC0fIrbm"
    }
    
    func imageURL()->URL{
        return URL(string: self.imagePath())!
    }
    
    
}
