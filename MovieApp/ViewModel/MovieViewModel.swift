

import Foundation
class MovieViewModel {
    var allMovies: [CategoryMovie] = []
    var detailInfo : MovieDetail?
    var movieManager = MoviesManager()
    
    var success : (()->())?
    var error : ((String)->())?
    
    
    func getMoviesByCategory(){
        let categories: [MovieCategory] = [.nowPlaying, .popular, .topRated, .upComing]
        for category in categories {
            movieManager.getMovies(type: category)  { items , error in
                if let error = error {
                    self.error?(error.localizedDescription)
                    return
                }
                if items != nil {
                    let movie = CategoryMovie(
                        id: UUID(),
                        title: "\(category.rawValue)",
                        movies: items ?? [],
                        category: category
                    )
                    self.allMovies.append(movie)
                    self.success?()
                }
                
                
            }
        }
        
    }
    
    func getMovieDetailInfo(id:Int,completion : @escaping (Result<MovieDetail,Error>)->Void){
        movieManager.getMovieDetailInfo(id: id){items, error in
            if let data = items {
                self.detailInfo = data
                completion(.success(data))
                
            }
            else if let error = error {
                completion(.failure(error))
                
            }
            
            
        }
        
    }
}






