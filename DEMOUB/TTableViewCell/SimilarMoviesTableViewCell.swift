//
//  SimilarMoviesTableViewCell.swift
//  DEMOUB
//
//  Created by Neosoft on 25/03/24.
//

import UIKit
import Kingfisher

class SimilarMoviesTableViewCell: UITableViewCell {

    @IBOutlet weak var SimilarMovies: UICollectionView! {
        didSet {
            SimilarMovies.delegate = self
            SimilarMovies.dataSource = self
            SimilarMovies.register(UINib(nibName: "SimilarMovieImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SimilarMovieImageCollectionViewCell")
        }
    }
    
    var data: MovieDetail?
    var similarData: SimilarMovie?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        SimilarMovies.reloadData()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func setData(data: DetailsResults) {
        self.SimilarMovies.reloadData()
        
    }
//    func setData(data: MovieDetail) {
//        if let posterPath = data.poster_path {
//                   let imageUrlString = "\(baseUrl)\(posterPath)"
//                   let urlWithoutWhiteSpace = imageUrlString.replacingOccurrences(of: " ", with: "")
//                   if let imageUrl = URL(string: imageUrlString) {
//                       castImage.kf.setImage(with: imageUrl)
//                   } else {
//                       print("Invalid URL")
//                   }
//               } else {
//                   print("Poster path not available")
//               }
//    }
//    
}

extension SimilarMoviesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return similarData?.results?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = SimilarMovies.dequeueReusableCell(withReuseIdentifier: "SimilarMovieImageCollectionViewCell", for: indexPath) as! SimilarMovieImageCollectionViewCell
        cell.similarSetData(data: similarData)
        return cell
    }
//    func didTapButtonInCell(_ cell: SimilarMovieImageCollectionViewCell) {
//           
//            if let indexPath = collectionView.indexPath(for: cell) {
//               
//                let movie = SimilarMovies
//                // Instantiate and push/present MovieDetailViewController
//                let movieDetailVC = SecondViewController(movie: MovieDetail)
//                navigationController?.pushViewController(movieDetailVC, animated: true)
//            }
//        }
//    
//    
}
