//
//  DetailViewModel.swift
//  DEMOUB
//
//  Created by Neosoft on 27/03/24.
//

import Foundation

class DetailViewModel {
    // Create the network manager
    let networkManager = NetworkManager()
    var movieDetail: MovieDetail?
    var crew: CastCrew?
    var cast: CastCrew?
    var movieReview: [ReviewResults]? = []
    var similarMovie:SimilarMovie?
    var dataFetchSuccessful: (() -> Void) = { }

    func fetchMovieDetail(ID: Int) {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(ID)?api_key=bcf733d3db25a3c884b70c8ee6bb07a4") else {
            return print("Invalid URL")
        }
        networkManager.request(fromURL: url) { (result: Result<MovieDetail, Error>) in
            switch result {
            case .success(let data):
                self.movieDetail = data
                self.dataFetchSuccessful()
                debugPrint("We got a successful result")
            case .failure(let error):
                debugPrint("We got a failure trying to get the data. The error we got was: \(error.localizedDescription)")
            }
        }
    }
    
    func fetchCrew(CrewId: Int) {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(CrewId)/credits?api_key=bcf733d3db25a3c884b70c8ee6bb07a4") else {
            return print("Invalid URL")
        }
        networkManager.request(fromURL: url) { (result: Result<CastCrew, Error>) in
            switch result {
            case .success(let data):
                self.crew = data
                self.dataFetchSuccessful()
                debugPrint("We got a successful result")
            case .failure(let error):
                debugPrint("We got a failure trying to get the data. The error we got was: \(error.localizedDescription)")
            }
        }
    }
//    func fetchCast(CastId: Int) {
//        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(CastId)/credits?api_key=bcf733d3db25a3c884b70c8ee6bb07a4") else {
//            return print("Invalid URL")
//        }
//        networkManager.request(fromURL: url) { (result: Result<CastCrew, Error>) in
//            switch result {
//            case .success(let data):
//                self.cast = data
//                self.dataFetchSuccessful()
//                debugPrint("We got a successful result")
//            case .failure(let error):
//                debugPrint("We got a failure trying to get the data. The error we got was: \(error.localizedDescription)")
//            }
//        }
//    }
    func fetchReview(Id: Int) {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(Id)/reviews?api_key=bcf733d3db25a3c884b70c8ee6bb07a4") else {
            return print("Invalid URL")
        }
        networkManager.request(fromURL: url) { (result: Result<Review, Error>) in
            switch result {
            case .success(let data):
                self.movieReview = data.reviewResults
                self.dataFetchSuccessful()
                debugPrint("We got a successful result")
            case .failure(let error):
                debugPrint("We got a failure trying to get the data. The error we got was: \(error.localizedDescription)")
            }
        }
    }
    
    func fetchSimilarMovies(Id: Int) {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(Id)/similar?api_key=bcf733d3db25a3c884b70c8ee6bb07a4") else {
            return print("Invalid URL")
        }
        networkManager.request(fromURL: url) { (result: Result<SimilarMovie, Error>) in
            switch result {
            case .success(let data):
                self.similarMovie = data
                self.dataFetchSuccessful()
                debugPrint("We got a successful result")
            case .failure(let error):
                debugPrint("We got a failure trying to get the data. The error we got was: \(error.localizedDescription)")
            }
        }
    }
    
}
