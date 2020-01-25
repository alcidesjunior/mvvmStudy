//
//  Service.swift
//  MVVMStudy
//
//  Created by Alcides Junior on 24/01/20.
//  Copyright © 2020 Alcides Junior. All rights reserved.
//

import Foundation

enum APIResources: String{
    case url = "https://api.themoviedb.org/3/"
    case apiKey = "fb36a114c1dd651ad2d0d45ebbabad10"
    case moviesPopular = "movie/popular"
    case baseImageUrl = "https://image.tmdb.org/t/p/w400"
}

enum Service: ServiceProtocol{
    
    case popular(apiKey: String)
    
    var baseURL: URL{
        return URL(string: APIResources.url.rawValue)!
    }
    
    var path: String{
        switch self {
        case .popular:
            return APIResources.moviesPopular.rawValue
        }
    }
    
    var method: HTTPMethod{
        return .get
    }
    
    var task: Task{
        switch self {
        case .popular(let apiKey):
            let parameters = ["api_key": apiKey]
            return .requestParameters(parameters)
        }
    }
    
    var headers: Headers?{
        return nil
    }
    
    var parametersEncoding: ParametersEncoding{
        return .url
    }
    
    
}
