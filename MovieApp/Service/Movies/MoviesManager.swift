//
//  MoviesManager.swift
//  MovieApp
//
//  Created by Nurluay Sharifova on 10.11.24.
//

import Foundation
class MoviesManager {
    var service = Service()
   
    func getPopularMovies(completion : @escaping (([Movies]?,Error?)->Void)){
        service.fetchData(urlPath: MoviesEndpoint.popular.url, type: MovieResponse.self){
            result in
            switch result {
            case .success(let success):
                completion(success.results,nil)
            case .failure(let error):
                completion(nil,error)
            }
        }
    }
    func getTopRatedMovies(completion : @escaping (([Movies]?,Error?)->Void)){
        service.fetchData(urlPath: MoviesEndpoint.topRated.url, type: MovieResponse.self){
            result in
            switch result {
            case .success(let success):
                completion(success.results,nil)
            case .failure(let error):
                completion(nil,error)
            }
        }
    }
    func getNowPlayingMovies(completion : @escaping (([Movies]?,Error?)->Void)){
        service.fetchData(urlPath: MoviesEndpoint.nowPlaying.url, type: MovieResponse.self){
            result in
            switch result {
            case .success(let success):
                completion(success.results,nil)
            case .failure(let error):
                completion(nil,error)
            }
        }
    }
}
