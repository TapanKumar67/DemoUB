//
//  SearchListTableViewCell.swift
//  DEMOUB
//
//  Created by Neosoft on 01/04/24.
//

import UIKit

class SearchListTableViewCell: UITableViewCell {

    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    var searchData: SearchResults?
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    func setData(data: SearchResults?) {
        self.movieName.text = data?.original_title
        if let posterPath = data?.poster_path {
            let imageUrlString = "\(baseUrl)\(posterPath)"
            let urlWithoutWhiteSpace = imageUrlString.replacingOccurrences(of: " ", with: "")
            if let imageUrl = URL(string: imageUrlString) {
                movieImage.kf.setImage(with: imageUrl)
            } else {
                print("Invalid URL")
            }
        } else {
            print("Poster path not available")
        }
        
    }
}
