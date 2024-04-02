//
//  CastTableViewCell.swift
//  DEMOUB
//
//  Created by Neosoft on 27/03/24.
//

import UIKit
import Kingfisher

class CastTableViewCell: UITableViewCell {

    @IBOutlet weak var castImage: UICollectionView!{
        didSet {
            castImage.delegate = self
            castImage.dataSource = self
            castImage.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionViewCell")
        }
        
    }
    
    var data: MovieDetail?
    var castData: [Cast]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        castImage.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func setData(cast: [Cast]?) {
        castData = []
        castData = cast
        self.castImage.reloadData()
        
//        if let posterPath = data?[0].profile_path {
//                   let imageUrlString = "\(baseUrl)\(posterPath)"
//                   let urlWithoutWhiteSpace = imageUrlString.replacingOccurrences(of: " ", with: "")
//                   if let imageUrl = URL(string: imageUrlString) {
////                       castImage.kf.setImage(with: imageUrl)
//                   } else {
//                       print("Invalid URL")
//                   }
//               } else {
//                   print("Poster path not available")
//               }
    }
    
}

extension CastTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return castData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = castImage.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        cell.setCastData(data: castData?[indexPath.row])
        return cell
    }
    
    
}
