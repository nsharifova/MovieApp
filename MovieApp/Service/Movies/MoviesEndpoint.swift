//
//  MoviesEndpoint.swift
//  MovieApp
//
//  Created by Nurluay Sharifova on 10.11.24.
//

import Foundation

enum MoviesEndpoint: String {
    
    case popular = "/popular"
    case nowPlaying = "/now_playing"
    case topRated = "/top_rated"
    case upComing = "/upcoming"
    
    var url: String {
        switch self {
        case .popular:
            return APIManagerHelper.shared.APIUrl(url:MoviesEndpoint.popular.rawValue)
            
        case .nowPlaying:
            return APIManagerHelper.shared.APIUrl(url:MoviesEndpoint.nowPlaying.rawValue)
            
        case .topRated:
            return APIManagerHelper.shared.APIUrl(url:MoviesEndpoint.topRated.rawValue)
            
        case .upComing:
            return APIManagerHelper.shared.APIUrl(url:MoviesEndpoint.upComing.rawValue)
        }
        
        
    }
    
}
