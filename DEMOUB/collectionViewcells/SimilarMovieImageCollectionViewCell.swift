//
//  SimilarMovieImageCollectionViewCell.swift
//  DEMOUB
//
//  Created by Neosoft on 25/03/24.
//

import UIKit
import Kingfisher

//protocol MovieCellDelegate: AnyObject {
//    func didTapButtonInCell(_ cell: SimilarMovieImageCollectionViewCell)
//}
class SimilarMovieImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var movieTitle: UILabel!
    
    @IBOutlet weak var poster: UIImageView!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    //    var data: MovieDetail?
    var data: SimilarMovie?
//   var results: DetailsResults?
    
    func similarSetData(data: SimilarMovie?) {
        if let posterPath = data?.results?.first?.poster_path {
            let imageUrlString = "\(baseUrl)\(posterPath)"
            let urlWithoutWhiteSpace = imageUrlString.replacingOccurrences(of: " ", with: "")
            if let imageUrl = URL(string: imageUrlString) {
                poster.kf.setImage(with: imageUrl)
            } else {
                print("Invalid URL")
            }
        } else {
            print("Poster path not available")
        }
        self.movieTitle.text = data?.results?.first?.original_title
    }
}
