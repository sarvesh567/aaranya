//
//  SlideTableViewCell.swift
//  Aaranya
//
//  Created by Sarvesh Patel on 13/03/21.
//

import UIKit

class SlideTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var settingLabel: UILabel!
      override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
