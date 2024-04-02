/* 
Copyright (c) 2024 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation

struct MovieDetail : Codable {
	let adult : Bool?
	let backdrop_path : String?
	let belongs_to_collection : Collection?
	let budget : Int?
	let genres : [Genres]?
	let homepage : String?
	let id : Int?
	let imdb_id : String?
	let original_language : String?
	let original_title : String?
	let overview : String?
	let popularity : Double?
	let poster_path : String?
	let productioncompanies : [Production_Companies]?
	let productioncountries : [Production_Countries]?
	let release_date : String?
	let revenue : Int?
	let runtime : Int?
	let spoken_languages : [SpokenLanguages]?
	let status : String?
	let tagline : String?
	let title : String?
	let video : Bool?
	let vote_average : Double?
	let vote_count : Int?

//	enum CodingKeys: String, CodingKey {
//
//		case adult = "adult"
//		case backdrop_path = "backdrop_path"
//		case belongs_to_collection = "belongs_to_collection"
//		case budget = "budget"
//		case genres = "genres"
//		case homepage = "homepage"
//		case id = "id"
//		case imdb_id = "imdb_id"
//		case original_language = "original_language"
//		case original_title = "original_title"
//		case overview = "overview"
//		case popularity = "popularity"
//		case poster_path = "poster_path"
//		case production_companies = "production_companies"
//		case production_countries = "production_countries"
//		case release_date = "release_date"
//		case revenue = "revenue"
//		case runtime = "runtime"
//		case spoken_languages = "spoken_languages"
//		case status = "status"
//		case tagline = "tagline"
//		case title = "title"
//		case video = "video"
//		case vote_average = "vote_average"
//		case vote_count = "vote_count"
//	}

}
struct Collection : Codable {
    let id : Int?
    let name : String?
    let poster_path : String?
    let backdrop_path : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case poster_path = "poster_path"
        case backdrop_path = "backdrop_path"
    }

}

struct Production_Companies : Codable {
    let id : Int?
    let logo_path : String?
    let name : String?
    let origin_country : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case logo_path = "logo_path"
        case name = "name"
        case origin_country = "origin_country"
    }

}
struct Production_Countries : Codable {
    let iso_3166_1 : String?
    let name : String?

    enum CodingKeys: String, CodingKey {

        case iso_3166_1 = "iso_3166_1"
        case name = "name"
    }

}
struct SpokenLanguages : Codable {
    let english_name : String?
    let iso_639_1 : String?
    let name : String?

    enum CodingKeys: String, CodingKey {

        case english_name = "english_name"
        case iso_639_1 = "iso_639_1"
        case name = "name"
    }

}
struct SimilarMovie : Codable {
    let page : Int?
    let results : [DetailsResults]?
    let total_pages : Int?
    let total_results : Int?

    enum CodingKeys: String, CodingKey {

        case page = "page"
        case results = "results"
        case total_pages = "total_pages"
        case total_results = "total_results"
    }
}
struct DetailsResults : Codable {
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
struct Genres : Codable {
    let id : Int?
    let name : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
    }
}
