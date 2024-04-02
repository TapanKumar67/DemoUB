//
//  MovieListData.swift
//  DEMOUB
//
//  Created by Neosoft on 25/03/24.
//

import Foundation

struct Movies : Codable {
    let dates : Dates?
    let page : Int?
    let results : [Results]?
    let total_pages : Int?
    let total_results : Int?
    
    enum CodingKeys: String, CodingKey {
        case dates = "dates"
        case page = "page"
        case results = "results"
        case total_pages = "total_pages"
        case total_results = "total_results"
    }
}

    struct Dates : Codable {
        let maximum : String?
        let minimum : String?
        
        enum CodingKeys: String, CodingKey {
            case maximum = "maximum"
            case minimum = "minimum"
        }
    }

    struct Results : Codable {
        let adult : Bool?
        let backdrop_path : String?
        let genre_ids : [Int]?
        let id : Int?
        let original_language : String?
        let original_title : String?
        let overview : String?
        let popularity : Double?
        let poster_path : String?
        let release_date : String?
        let title : String?
        let video : Bool?
        let vote_average : Double?
        let vote_count : Int?

        enum CodingKeys: String, CodingKey {
            case adult = "adult"
            case backdrop_path = "backdrop_path"
            case genre_ids = "genre_ids"
            case id = "id"
            case original_language = "original_language"
            case original_title = "original_title"
            case overview = "overview"
            case popularity = "popularity"
            case poster_path = "poster_path"
            case release_date = "release_date"
            case title = "title"
            case video = "video"
            case vote_average = "vote_average"
            case vote_count = "vote_count"
        }

    }

struct CastCrew : Codable {
    let id : Int?
    let cast : [Cast]?
    let crew : [Crew]?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case cast = "cast"
        case crew = "crew"
    }

}

struct Cast : Codable {
    let adult : Bool?
    let gender : Int?
    let id : Int?
    let known_for_department : String?
    let name : String?
    let original_name : String?
    let popularity : Double?
    let profile_path : String?
    let cast_id : Int?
    let character : String?
    let credit_id : String?
    let order : Int?
    
    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case gender = "gender"
        case id = "id"
        case known_for_department = "known_for_department"
        case name = "name"
        case original_name = "original_name"
        case popularity = "popularity"
        case profile_path = "profile_path"
        case cast_id = "cast_id"
        case character = "character"
        case credit_id = "credit_id"
        case order = "order"
    }
}

struct Crew : Codable {
    let adult : Bool?
    let gender : Int?
    let id : Int?
    let known_for_department : String?
    let name : String?
    let original_name : String?
    let popularity : Double?
    let profile_path : String?
    let credit_id : String?
    let department : String?
    let job : String?

    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case gender = "gender"
        case id = "id"
        case known_for_department = "known_for_department"
        case name = "name"
        case original_name = "original_name"
        case popularity = "popularity"
        case profile_path = "profile_path"
        case credit_id = "credit_id"
        case department = "department"
        case job = "job"
    }
}

struct Author_details : Codable {
    let name : String?
    let username : String?
    let avatar_path : String?
    let rating : Double?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case username = "username"
        case avatar_path = "avatar_path"
        case rating = "rating"
    }
}
struct Review : Codable {
    let id : Int?
    let page : Int?
    let reviewResults : [ReviewResults]?
    let total_pages : Int?
    let total_results : Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case page = "page"
        case reviewResults = "results"
        case total_pages = "total_pages"
        case total_results = "total_results"
    }
}
struct ReviewResults : Codable {
    let author : String?
    let author_details : Author_details?
    let content : String?
    let created_at : String?
    let id : String?
    let updated_at : String?
    let url : String?
    
    enum CodingKeys: String, CodingKey {
        case author = "author"
        case author_details = "author_details"
        case content = "content"
        case created_at = "created_at"
        case id = "id"
        case updated_at = "updated_at"
        case url = "url"
    }
}


