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
    
    func labelValue()->String{
        return self.movie?.originalTitle ?? ""
    }
    
    
}
