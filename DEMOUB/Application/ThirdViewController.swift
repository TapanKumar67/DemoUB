//
//  ThirdViewController.swift
//  DEMOUB
//
//  Created by Neosoft on 26/03/24.
//

import UIKit

class ThirdViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
        
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var thirdTableView: UITableView!{
        didSet{
            thirdTableView.register(UINib(nibName: "SearchListTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchListTableViewCell")
        }
    }
    
    var viewModel = SearchViewModel()
    var searchData: Search?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        searchBar.delegate = self
        viewModel.fetchSearch(title: searchBar.text ?? "") { serach in
                print("Serach", serach)
            self.thirdTableView.reloadData()
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    func getData() {
        viewModel.dataFetchSuccessful = { [weak self] in
            guard let self = self else { return }
            self.thirdTableView.reloadData()
        }
    }
}
extension ThirdViewController {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        viewModel.fetchSearch(title: searchBar.text ?? "") { serach in
                print("Serach", serach)
                self.thirdTableView.reloadData()
        }
        

}
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        true
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.searchResult?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchListTableViewCell", for: indexPath) as! SearchListTableViewCell
        let movie = viewModel.searchResult?[indexPath.row]
        cell.setData(data: movie)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard =  UIStoryboard(name: "Main", bundle: nil)
        if let secondViewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController {
            secondViewController.movieID = viewModel.searchResult?[indexPath.row].id
            navigationController?.pushViewController(secondViewController, animated: true)
        }
    }
}
