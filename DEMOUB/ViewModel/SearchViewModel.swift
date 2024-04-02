//
//  SearchViewModel.swift
//  DEMOUB
//
//  Created by Neosoft on 28/03/24.
//

import Foundation

class SearchViewModel {
    let networkManager = NetworkManager()
    var search:Search?
    var searchResult: [SearchResults]? = [SearchResults]()
//    var defult = UserDefaults.standard
//    var movies : [Movi]
    var dataFetchSuccessful: (() -> Void) = { }
    
    
    func fetchSearch(title: String, _ completion: @escaping ([SearchResults]?) -> Void) {
        guard let url = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=bcf733d3db25a3c884b70c8ee6bb07a4&query=\(title)") else {
            print("Invalid URL")
            return  }
        
        networkManager.request(fromURL: url) { (result: Result<Search, Error>) in
            switch result {
            case .success(let success):
                debugPrint("We got a successful result", success)
                self.searchResult = success.results ?? []
                completion(success.results)
            case .failure(let failure):
               // completion(Search)
                self.searchResult = [SearchResults]()
                print("Getting error")
               // debugPrint("We got a failure trying to get the data. The error we got was: \(error.localizedDescription)")
            }
        }
      }
//    func saveData() {
//        defult.set(<#T##value: Any?##Any?#>, forKey: <#T##String#>)
//    }
    
}

