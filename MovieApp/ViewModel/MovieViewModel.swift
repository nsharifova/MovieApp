

import Foundation
import FirebaseFirestore

class MovieViewModel {
    var allMovies: [CategoryMovie] = []
    var favoriteMovies: [FavoriteMovie] = []
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
    func getFavoriteMovies(userId:String){
        let db = Firestore.firestore()
        db.collection("Users").document(userId).collection("Favorites").getDocuments{ items,error in
            
            if let error = error {
                self.error?(error.localizedDescription)
            } else {
                self.favoriteMovies.removeAll()
                for document in items?.documents ?? [] {
                           do {
                               let movie = try document.data(as: FavoriteMovie.self)
                               self.favoriteMovies.append(movie)
                           } catch {
                               self.error?(error.localizedDescription)
                           }
                       }
                self.success?()

            }
        }
        
    }
    func addMovieFavorites(userId:String,movieId:String,movieData: [String: Any]){

        let db = Firestore.firestore()
        db.collection("Users").document(userId).collection("Favorites").document(movieId).setData(movieData) { error in
            if let error = error {
                self.error?(error.localizedDescription)
            } else {
                NotificationCenter.default.post(name: NSNotification.Name("AddedFavorites"), object: nil)

                self.success?()
                
            }
            
        }
        
    }
}






