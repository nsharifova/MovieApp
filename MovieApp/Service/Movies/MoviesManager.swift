//
//  MoviesManager.swift
//  MovieApp
//
//  Created by Nurluay Sharifova on 10.11.24.
//

import Foundation
class MoviesManager {
    var service = Service()

    func getMovies(type:MovieCategory,completion: @escaping (([Movies]?,Error?)->Void)){
        var url = ""
        switch type {
        case .nowPlaying:
            url = MoviesEndpoint.nowPlaying.url
        case .popular:
            url = MoviesEndpoint.popular.url
        case .upComing:
            url = MoviesEndpoint.upComing.url
        case .topRated:
            url = MoviesEndpoint.topRated.url
        }
        service.fetchData(urlPath: url, type: MovieResponse.self){
            result in
            switch result {
            case .success(let success):
                completion(success.results,nil)
            case .failure(let error):
                completion(nil,error)
            }
        }
        
        
    }
    func getMovieDetailInfo(id:Int,completion : @escaping ((MovieDetail?,Error?)->Void)){
        service.fetchData(urlPath: MoviesEndpoint.byId(id: id).url, type: MovieDetail.self){
               result in
               switch result {
               case .success(let success):
                   completion(success,nil)
                   print("Url:\(MoviesEndpoint.byId(id: id).url)")
               case .failure(let error):
                   completion(nil,error)
                   print("Error:\(error)")
               }
           }
       }
}
