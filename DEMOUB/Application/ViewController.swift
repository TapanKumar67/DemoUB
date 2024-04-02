//
//  ViewController.swift
//  DEMOUB
//
//  Created by Neosoft on 24/03/24.
//

import UIKit
import Kingfisher

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    

    @IBOutlet weak var myTableView: UITableView! {
        didSet{
            myTableView.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "MyTableViewCell")
            myTableView.delegate = self
            myTableView.dataSource = self
        }
    }
    @IBOutlet weak var searchBtn: UIBarButtonItem!
    
    var viewModel = MovieViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchMovieData()
        getData()
      
    }

    @IBAction func buttonTap(_ sender: UIBarButtonItem) {
        let thirdVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
               
             
//               self.present(thirdVC, animated: true, completion: nil)
        self.navigationController?.pushViewController(thirdVC, animated: true)
        
    }
    //    override func viewWillAppear(_ animated: Bool) {
//        getData()
//    }
    func getData() {
        viewModel.moviesFetchSuccessful = { [weak self] in
            guard let self = self else { return }
                self.myTableView.reloadData()
        }
    }

}

extension ViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movieData?.results?.count ?? 0
}
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as! MyTableViewCell
        cell.movieData = viewModel.movieData
        cell.setData(index: indexPath.row)
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                if let secondViewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController {
                    secondViewController.movieData = viewModel.movieData?.results?[indexPath.row]
                    secondViewController.movieID = viewModel.movieData?.results?[indexPath.row].id
                    navigationController?.pushViewController(secondViewController, animated: true)
         
                //  object.movieData = viewModel.movieData[indexPath.row]
    }
        
}
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
