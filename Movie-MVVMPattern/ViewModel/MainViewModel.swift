//
//  MainViewModel.swift
//  Movie-MVVMPattern
//
//  Created by e.mubarakov on 07.05.2023.
//

import Foundation

class MainViewModel {
    
    var isLoading: Observable<Bool> = Observable(false)
    var cellDataSource: Observable<[MovieTableCellViewModel]> = Observable(nil)
    var dataSource: MoviesModel?
    
    func nymberOfSections() -> Int {
        1
    }
    
    func numberOfRows() -> Int {
        dataSource?.search.count ?? 0
    }
    
    func getData() {
        if isLoading.value ?? true {
            return
        }
        isLoading.value = true
        APICaller.getMovies { [weak self] result in
            self?.isLoading.value = false
            
            switch result {
            case .success(let data):
                print("Movies:" + data.totalResults)
                self?.dataSource = data
                self?.mapCellData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func mapCellData() {
        self.cellDataSource.value = self.dataSource?.search.compactMap({MovieTableCellViewModel(movie: $0)})
    }
}
