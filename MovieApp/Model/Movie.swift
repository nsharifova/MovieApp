import Foundation
import UIKit

struct MovieResponse: Codable {
    let page: Int
    let results: [Movies]
    let totalPages: Int
    let totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
enum MovieCategory: String {
    case popular = "Popular"
    case nowPlaying = "Now Playing"
    case topRated = "Top Rated"
    case upComing = "Upcoming"
}

struct CategoryMovie {
    let id: UUID
    let title: String
    let movies : [Movies]
    let category: MovieCategory
}
struct Movies: Codable, Hashable {
    let adult: Bool
    let backdropPath: String?
    let genreIDS: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let releaseDate: String?
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    let posterPath: String?
    
    enum CodingKeys: String, CodingKey {
           case adult
           case backdropPath = "backdrop_path"
           case genreIDS = "genre_ids"
           case id
           case originalLanguage = "original_language"
           case originalTitle = "original_title"
           case overview
           case popularity
           case releaseDate = "release_date"
           case title
           case video
           case voteAverage = "vote_average"
           case voteCount = "vote_count"
           case posterPath = "poster_path"
       }
}

typealias DataSource = UICollectionViewDiffableDataSource<Section, Movies>

struct MovieDetail: Codable {
    let adult: Bool
    let backdropPath: String?
    let belongsToCollection: BelongsToCollection?
    let budget: Int
    let genres: [Genre]
    let homepage: String?
    let id: Int
    let imdbID: String
    let originCountry: [String]
    let originalLanguage, originalTitle, overview: String?
    let popularity: Double
    let posterPath: String?
    let productionCompanies: [ProductionCompany]
    let productionCountries: [ProductionCountry]
    let releaseDate: String
    let revenue, runtime: Int?
    let spokenLanguages: [SpokenLanguage]
    let status, tagline, title: String?
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    
    enum CodingKeys: String, CodingKey {
           case adult
           case backdropPath = "backdrop_path"
           case belongsToCollection = "belongs_to_collection"
           case budget, genres, homepage, id
           case imdbID = "imdb_id"
           case originCountry = "origin_country"
           case originalLanguage = "original_language"
           case originalTitle = "original_title"
           case overview, popularity
           case posterPath = "poster_path"
           case productionCompanies = "production_companies"
           case productionCountries = "production_countries"
           case releaseDate = "release_date"
           case revenue, runtime
           case spokenLanguages = "spoken_languages"
           case status, tagline, title, video
           case voteAverage = "vote_average"
           case voteCount = "vote_count"
       }

   
}
struct BelongsToCollection: Codable {
    let id: Int
    let name, posterPath, backdropPath: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
    }
}
struct Genre: Codable {
    let id: Int
    let name: String
}

struct ProductionCompany: Codable {
    let id: Int
    let logoPath: String?
    let name, originCountry: String

    enum CodingKeys: String, CodingKey {
        case id
        case logoPath = "logo_path"
        case name
        case originCountry = "origin_country"
    }
}

struct ProductionCountry: Codable {
    let iso3166_1, name: String

    enum CodingKeys: String, CodingKey {
        case iso3166_1 = "iso_3166_1"
        case name
    }
}

struct SpokenLanguage: Codable {
    let englishName, iso639_1, name: String

    enum CodingKeys: String, CodingKey {
        case englishName = "english_name"
        case iso639_1 = "iso_639_1"
        case name
    }
}
