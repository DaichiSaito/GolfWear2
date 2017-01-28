//
//  BrandTableViewCell2.swift
//  GolfWear
//
//  Created by DaichiSaito on 2017/01/26.
//  Copyright © 2017年 DaichiSaito. All rights reserved.
//

import UIKit

class BrandTableViewCell2: UITableViewCell {

    @IBOutlet weak var brandName: UILabel!
    var rowIndex: Int?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
