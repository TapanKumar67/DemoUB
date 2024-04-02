//
//  ViewModel.swift
//  DEMOUB
//
//  Created by Sushil Rajpurohit on 25/03/24.
//

import Foundation

class MovieViewModel {
    // Create the network manager
    let networkManager = NetworkManager()
    var movieData: Movies?
    var moviesFetchSuccessful: (() -> Void) = { }

    func fetchMovieData() {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=bcf733d3db25a3c884b70c8ee6bb07a4") else {
            return print("Invalid URL")
        }
        networkManager.request(fromURL: url) { (result: Result<Movies, Error>) in
            switch result {
            case .success(let data):
                self.movieData = data
                self.moviesFetchSuccessful()
                debugPrint("We got a successful result")
            case .failure(let error):
                debugPrint("We got a failure trying to get the data. The error we got was: \(error.localizedDescription)")
            }
        }
    }
}
