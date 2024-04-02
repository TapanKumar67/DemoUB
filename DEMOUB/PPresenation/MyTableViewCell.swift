//
//  MyTableViewCell.swift
//  DEMOUB
//
//  Created by Neosoft on 24/03/24.
//

import UIKit
import Kingfisher
let baseUrl = "https://image.tmdb.org/t/p/original"
class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var moviePoster: UIImageView!
    
    @IBOutlet weak var movieName: UILabel!
    
    @IBOutlet weak var releaseDate: UILabel!
    
    @IBOutlet weak var voteCount: UILabel!
    
    
    var movieData: Movies?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setData(index: Int) {
        if let posterPath = movieData?.results?[index].poster_path {
            let imageUrlString = "\(baseUrl)\(posterPath)"
            let urlWithoutWhiteSpace = imageUrlString.replacingOccurrences(of: " ", with: "")
            if let imageUrl = URL(string: imageUrlString) {
                moviePoster.kf.setImage(with: imageUrl)
            } else {
                print("Invalid URL")
            }
        } else {
            print("Poster path not available")
        }

        self.movieName.text = movieData?.results?[index].original_title
        self.releaseDate.text = movieData?.results?[index].release_date
        self.voteCount.text = "\(movieData?.results?[index].vote_count ?? 0)"
//        self.rate.text = String(format: "%.2f", movieData?.results?[index].vote_average ?? "")
       
    }
}
