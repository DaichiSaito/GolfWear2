//
//  BrandTableViewCell.swift
//  GolfWear
//
//  Created by DaichiSaito on 2017/01/13.
//  Copyright © 2017年 DaichiSaito. All rights reserved.
//

import UIKit

class BrandTableViewCell: UITableViewCell {

    @IBOutlet weak var brandName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
