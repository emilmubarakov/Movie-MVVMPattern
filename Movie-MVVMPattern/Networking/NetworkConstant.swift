//
//  NetworkConstant.swift
//  Movie-MVVMPattern
//
//  Created by e.mubarakov on 07.05.2023.
//

import Foundation

class NetworkConstant {
    
    public static var shared: NetworkConstant = NetworkConstant()
    
    private init() {
        
    }
    
    public var apiKey: String {
        get {
            return "b93acc47"
        }
    }
    
    public var movieTitleFilter: String {
        get {
            return "s=" + "house"
        }
    }
    
    public var serverAddress: String {
        get {
            return "https://www.omdbapi.com/?"
        }
    }
    
}
