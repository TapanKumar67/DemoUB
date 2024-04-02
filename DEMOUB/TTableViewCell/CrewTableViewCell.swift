//
//  CrewTableViewCell.swift
//  DEMOUB
//
//  Created by Neosoft on 25/03/24.
//

import UIKit
import Kingfisher

class CrewTableViewCell: UITableViewCell {

    @IBOutlet weak var crewImages: UICollectionView! {
        didSet {
            crewImages.delegate = self
            crewImages.dataSource = self
            crewImages.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionViewCell")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        crewImages.reloadData()
    }
    
   var data: MovieDetail?
    var crewData: [Crew]?
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
//    func configure(crewName: String) {
//           
//        }
    func setData(crew:[Crew]?) {
        crewData = []
        crewData = crew
        
        self.crewImages.reloadData()
        
    }
    
}
extension CrewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return crewData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        cell.setData(data: crewData?[indexPath.row])
        return cell
        
    }
        
}

