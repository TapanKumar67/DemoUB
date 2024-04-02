//
//  SecondViewController.swift
//  DEMOUB
//
//  Created by Neosoft on 25/03/24.
//

import UIKit

class SecondViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
        enum SecScreen {
        case detail
        case cast
        case crew
        case review
        case similar
        
    }
    
    let cellSecScreen: [SecScreen] = [.detail,.cast,.crew,.review,.similar]
    @IBOutlet weak var secTableView: UITableView! {
        didSet {
            secTableView.register(UINib(nibName: "MovieDetailBannerTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieDetailBannerTableViewCell")
            secTableView.register(UINib(nibName: "CastTableViewCell", bundle: nil), forCellReuseIdentifier: "CastTableViewCell")
            secTableView.register(UINib(nibName: "CrewTableViewCell", bundle: nil), forCellReuseIdentifier: "CrewTableViewCell")
            secTableView.register(UINib(nibName: "ReviewCellTableViewCell", bundle: nil), forCellReuseIdentifier: "ReviewCellTableViewCell")
            secTableView.register(UINib(nibName: "SimilarMoviesTableViewCell", bundle: nil), forCellReuseIdentifier: "SimilarMoviesTableViewCell")
        }
        
    }
    var movieData: Results?
    var movieID: Int?
    var viewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false

        viewModel.fetchCrew(CrewId: movieID ?? 0)
        viewModel.fetchMovieDetail(ID: movieID ?? 0)
        viewModel.fetchSimilarMovies(Id: movieID ?? 0)
        viewModel.fetchReview(Id: movieID ?? 0)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getData()
    }
    
    func getData() {
        viewModel.dataFetchSuccessful = { [weak self] in
            guard let self = self else { return }
                self.secTableView.reloadData()
        }
    }
}

extension SecondViewController {
    func numberOfSections(in tableView: UITableView) -> Int {
        return cellSecScreen.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch cellSecScreen[section] {
        case .detail:
            return 1
            //            return 1
        case .crew:
            return 1
            //return viewModel.crew?.crew?.count ?? 0
            //            return 1
        case .review:
            return 1
        case .similar:
            return 1
            //   return viewModel.similarMovie?.results?.count ?? 0
        case .cast:
            return 1
            //  return viewModel.crew?.cast?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch cellSecScreen[indexPath.section] {
            
        case .crew:
            let cell = secTableView.dequeueReusableCell(withIdentifier: "CrewTableViewCell", for: indexPath) as! CrewTableViewCell
            cell.setData(crew: viewModel.crew?.crew)
            return cell
        case .review:
            let cell = secTableView.dequeueReusableCell(withIdentifier: "ReviewCellTableViewCell", for: indexPath) as! ReviewCellTableViewCell
            //            cell.content.text = viewModel.movieReview?.content
            cell.setData(data: viewModel.movieReview?.first)
            return cell
        case .similar:
            let cell = secTableView.dequeueReusableCell(withIdentifier: "SimilarMoviesTableViewCell", for: indexPath) as! SimilarMoviesTableViewCell
            cell.similarData = viewModel.similarMovie
           
            return cell
            
        case .detail:
            let cell = secTableView.dequeueReusableCell(withIdentifier: "MovieDetailBannerTableViewCell", for: indexPath) as! MovieDetailBannerTableViewCell
            cell.detailData = viewModel.movieDetail
            cell.setData(data: viewModel.movieDetail)
            
            return cell
        case .cast:
            let cell = secTableView.dequeueReusableCell(withIdentifier: "CastTableViewCell", for: indexPath) as! CastTableViewCell
            cell.setData(cast: viewModel.crew?.cast)
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch cellSecScreen[indexPath.section] {
        case .crew:
            return 170
            
        case .review:
            return 400
            
        case .similar:
            return 200
            
        case .detail:
            return 450
            
        case .cast:
            return 170
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = HeaderView.instanceFromNib() as! HeaderView
        
        switch section {
            
        case 0:
            print("")
        case 1:
            headerView.titlelabel.text = "Cast"
        case 2:
            headerView.titlelabel.text = "Crew"
            //            print("Crew")
        case 3:
            headerView.titlelabel.text = "Review"
            //            print("Review")
        case 4:
            headerView.titlelabel.text = "Similar"
            //            print("Similar")
        default:
            break
        }
        
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 0 {
            return  0.0
        } else {
            return 50.0
        }
    }
}

