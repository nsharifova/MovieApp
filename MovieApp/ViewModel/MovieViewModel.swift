

import Foundation
class MovieViewModel {
    
    
    var movie : [Movies] = []
    var topRatedMovies : [Movies] = []
    var nowPlayingMovies : [Movies] = []
    var movieManager = MoviesManager()

    func getPopularMovies(completion: @escaping (Result<[Movies], any Error>) -> Void) {
        movieManager.getPopularMovies { items , error in
            
            if let data = items {
                self.movie = data
                completion(.success(data))

            }
            else if let error {
                completion(.failure(error.localizedDescription as! Error))
            }
            
        }

    }
    func getTopRatedMovies(completion: @escaping (Result<[Movies], any Error>) -> Void) {
        movieManager.getTopRatedMovies { items , error in
            
            if let data = items {
                self.topRatedMovies = data
                completion(.success(data))

            }
            else if let error {
                completion(.failure(error.localizedDescription as! Error))
            }
            
        }
    }
    func getNowPlayingMovies(completion: @escaping (Result<[Movies], any Error>) -> Void) {
        movieManager.getNowPlayingMovies { items , error in
            
            if let data = items {
                self.nowPlayingMovies = data
                completion(.success(data))

            }
            else if let error {
                completion(.failure(error.localizedDescription as! Error))
            }
            
        }
    }
    }
   





