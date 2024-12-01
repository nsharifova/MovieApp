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
    case addFavorites (accountId: Int,sessionId: String)
    case favoriteMovies(accountId : Int)
    
    var url: String {
        switch self {
           
        case .favoriteMovies(let accountId):
            return APIManagerHelper.shared.APIUrl(url: "/account/\(accountId)/favorite/movies")
        case .popular:
            return APIManagerHelper.shared.APIUrl(url: "/movie/popular")
            
        case .nowPlaying:
            return APIManagerHelper.shared.APIUrl(url: "/movie/now_playing")
            
        case .topRated:
            return APIManagerHelper.shared.APIUrl(url: "/movie/top_rated")
            
        case .upComing:
            return APIManagerHelper.shared.APIUrl(url: "/movie/upcoming")
            
        case .byId(let id):
            return APIManagerHelper.shared.APIUrl(url: "/movie/\(id)")
            
        case .addFavorites(let accountId,let sessionId):
            return APIManagerHelper.shared.APIUrl(url: "account/\(accountId)/favorite",sessionId:sessionId)

        }
        
        
    }
    
}
