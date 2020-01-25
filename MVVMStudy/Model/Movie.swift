//
//  Movie.swift
//  MVVMStudy
//
//  Created by Alcides Junior on 24/01/20.
//  Copyright © 2020 Alcides Junior. All rights reserved.
//

import Foundation

struct Movie: Codable {
    let page, totalResults, totalPages: Int
    let results: [Results]

    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
}

// MARK: - Result
struct Results: Codable {
    let popularity: Double
    let posterPath: String
    let id: Int
    let originalTitle: String
    let genreIDS: [Int]
    let title: String

    enum CodingKeys: String, CodingKey {
        case popularity
        case posterPath = "poster_path"
        case id
        case originalTitle = "original_title"
        case genreIDS = "genre_ids"
        case title
    }
}
