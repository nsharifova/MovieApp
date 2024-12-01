//
//  MoviesManager.swift
//  MovieApp
//
//  Created by Nurluay Sharifova on 10.11.24.
//

import Foundation
import Alamofire
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
    func getFavoriteMovies(accountId : Int,completion: @escaping (([FavoriteMovie]?,Error?)->Void)){
        let headers: HTTPHeaders = [
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1MjZmOGIzOThmMzA2OTg4NjdmMzNmM2RlYzg0NWQwOSIsIm5iZiI6MTczMjE3NzAxMS42MjU1NTYsInN1YiI6IjY3MmZiYjhkM2MxMDRkODhiZGM1YTJmNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.YnJo5bpk5J2yELc2MxNbFQmkEALpswyXR8LztS1JUfc",
            "Content-Type": "application/json"

        ]
    
        service.fetchData(urlPath: MoviesEndpoint.favoriteMovies(accountId: accountId).url, type:FavoriteMovieResponce.self,headers:headers) {
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
               case .failure(let error):
                   completion(nil,error)
               }
           }
       }
    
  
}
