//
//  ReviewCellTableViewCell.swift
//  DEMOUB
//
//  Created by Neosoft on 25/03/24.
//

import UIKit

class ReviewCellTableViewCell: UITableViewCell {
    @IBOutlet weak var name1: UILabel!
    
    @IBOutlet weak var content: UITextView!
    @IBOutlet weak var dullimg: UIImageView!
    var reviewData: ReviewResults?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    @IBAction func reviewBtn(_ sender: UIButton) {
    }
    
    @IBOutlet weak var url: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    @IBAction func showAlllReview(_ sender: UIButton) {
        
    }
    func setData(data: ReviewResults?) {
        self.name1.text = data?.author_details?.avatar_path
        self.content.text = data?.content
        self.url.text = data?.url
    }
}
