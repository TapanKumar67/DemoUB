//
//  ImageCollectionViewCell.swift
//  DEMOUB
//
//  Created by Neosoft on 25/03/24.
//

import UIKit
import Kingfisher
class ImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var profileImage: UIImageView!{
        didSet {
           // profileImage.layer.cornerRadius =  35//  profileImage.bounds.width / 2
        }
    }
    @IBOutlet weak var crewName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    var crewData: [Crew]?
    var castData: Cast?
    
    func setData(data: Crew?) {
        if let posterPath = data?.profile_path {
            let imageUrlString = "\(baseUrl)\(posterPath)"
            let urlWithoutWhiteSpace = imageUrlString.replacingOccurrences(of: " ", with: "")
            if let imageUrl = URL(string: imageUrlString) {
                profileImage.kf.setImage(with: imageUrl)
            } else {
                print("Invalid URL")
            }
        } else {
            print("Poster path not available")
        }
        self.crewName.text = data?.original_name

    }
    
    func setCastData(data: Cast?) {
        if let posterPath = data?.profile_path {
            let imageUrlString = "\(baseUrl)\(posterPath)"
            let urlWithoutWhiteSpace = imageUrlString.replacingOccurrences(of: " ", with: "")
            if let imageUrl = URL(string: imageUrlString) {
                profileImage.kf.setImage(with: imageUrl)
            } else {
                print("Invalid URL")
            }
        } else {
            print("Poster path not available")
        }
        self.crewName.text = data?.original_name
    }
}

extension UIView {

  @IBInspectable var cornerRadius: CGFloat {

   get{
        return layer.cornerRadius
    }
    set {
        layer.cornerRadius = newValue
        layer.masksToBounds = newValue > 0
    }
  }

  @IBInspectable var borderWidth: CGFloat {
    get {
        return layer.borderWidth
    }
    set {
        layer.borderWidth = newValue
    }
  }

  @IBInspectable var borderColor: UIColor? {
    get {
        return UIColor(cgColor: layer.borderColor!)
    }
    set {
        layer.borderColor = borderColor?.cgColor
    }
  }
}
