//
//  MoviesEndpoint.swift
//  MovieApp
//
//  Created by Nurluay Sharifova on 10.11.24.
//

import Foundation

enum MoviesEndpoint {
    
    case popular
    case nowPlaying
    case topRated
    case upComing
    case byId(id: Int)
    
    var url: String {
        switch self {
        case .popular:
            return APIManagerHelper.shared.APIUrl(url: "/popular")
            
        case .nowPlaying:
            return APIManagerHelper.shared.APIUrl(url: "/now_playing")
            
        case .topRated:
            return APIManagerHelper.shared.APIUrl(url: "/top_rated")
            
        case .upComing:
            return APIManagerHelper.shared.APIUrl(url: "/upcoming")
            
        case .byId(let id):
            return APIManagerHelper.shared.APIUrl(url: "/\(id)")

        }
        
        
    }
    
}
