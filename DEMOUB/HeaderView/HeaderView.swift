//
//  HeaderView.swift
//  DEMOUB
//
//  Created by Neosoft on 28/03/24.
//

import UIKit

class HeaderView: UITableViewHeaderFooterView {
    
    @IBOutlet weak var titlelabel: UILabel!
    override func awakeFromNib() {
           super.awakeFromNib()
       }

    class func instanceFromNib() -> UIView {
            return UINib(nibName: "HeaderView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
        }
}
