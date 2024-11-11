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
    
    var url: String {
        switch self {
        case .popular:
            return "\(Constants.apiUrl)/popular?api_key=\(Constants.apiKey)&language=en-US"
            
        case .nowPlaying:
            return "\(Constants.apiUrl)/now_playing?api_key=\(Constants.apiKey)"
        case .topRated:
            return "\(Constants.apiUrl)/top_rated?api_key=\(Constants.apiKey)"

        case .upComing:
            return "\(Constants.apiUrl)/upcoming?api_key=\(Constants.apiKey)"

        }
        
 
    }
       
}
