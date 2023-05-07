//
//  MainViewModel.swift
//  Movie-MVVMPattern
//
//  Created by e.mubarakov on 07.05.2023.
//

import Foundation

class MainViewModel {
    
    func nymberOfSections() -> Int {
        1
    }
    
    func numberOfRows() -> Int {
        10
    }
    
    func getData() {
        APICaller.getMovies { result in
            switch result {
            case .success(let data):
                print("Movies:" + data.totalResults)
            case .failure(let error):
                print(error)
            }
        }
    }
}
