//
//  ALUCaller.swift
//  Movie-MVVMPattern
//
//  Created by e.mubarakov on 07.05.2023.
//

import Foundation

enum NetworkError: Error {
    case urlError
    case canNotParseData
}

class APICaller {
    
    static func getMovies(competionHandler: @escaping (_ result: Result<MoviesModel, NetworkError>) -> Void) {
        
        let urlString = NetworkConstant.shared.serverAddress + NetworkConstant.shared.movieTitleFilter + "&apikey=" + NetworkConstant.shared.apiKey
        
        guard let url = URL(string: urlString) else {
            competionHandler(.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                competionHandler(.failure(.canNotParseData))
                print(error)
            }
            
            guard let json = data else {return}
            
            do {
                let result = try JSONDecoder().decode(MoviesModel.self, from: json)
                DispatchQueue.main.async {
                    competionHandler(.success(result))
                }
            }
            catch {
                competionHandler(.failure(.canNotParseData))
                print(error.localizedDescription)
            }
        }.resume()
    }
}
