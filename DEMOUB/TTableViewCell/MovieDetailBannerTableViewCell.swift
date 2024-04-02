//
//  MovieDetailBannerTableViewCell.swift
//  DEMOUB
//
//  Created by Neosoft on 25/03/24.
//

import UIKit
import Kingfisher

class MovieDetailBannerTableViewCell: UITableViewCell {

    
    @IBOutlet weak var uiView: UIView!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var bigImage: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var movieTime: UILabel!
    @IBOutlet weak var releasingDate: UILabel!
    @IBOutlet weak var descriptions: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
    }
    var detailData: MovieDetail?
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    func setData(data: MovieDetail?) {
        self.movieName.text = detailData?.original_title
        if let posterPath = detailData?.poster_path {
            let imageUrlString = "\(baseUrl)\(posterPath)"
            let urlWithoutWhiteSpace = imageUrlString.replacingOccurrences(of: " ", with: "")
            if let imageUrl = URL(string: imageUrlString) {
                movieImage.kf.setImage(with: imageUrl)
                bigImage.kf.setImage(with: imageUrl)
            } else {
                print("Invalid URL")
            }
        } else {
            print("Poster path not available")
        }
        self.descriptions.text = data?.overview
    }
}
