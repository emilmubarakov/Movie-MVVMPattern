//
//  MovieTableCellViewVodel.swift
//  Movie-MVVMPattern
//
//  Created by e.mubarakov on 08.05.2023.
//

import UIKit

class MovieTableCellViewModel {

    var title, year, imdbID: String
    var type: TypeEnum
    var poster: String
    
    init(movie: Search) {
        self.title = movie.title
//        self.title =
        self.year = movie.year
        self.imdbID = movie.imdbID
        self.type = movie.type
        self.poster = movie.poster
    }
    

}
