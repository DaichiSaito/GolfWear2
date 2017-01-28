//
//  SexTableViewCell.swift
//  GolfWear
//
//  Created by DaichiSaito on 2017/01/14.
//  Copyright © 2017年 DaichiSaito. All rights reserved.
//

import UIKit

class SexTableViewCell: UITableViewCell {

    @IBOutlet weak var sexLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func setCells(indexPath: IndexPath) {
        self.sexLabel.text = ModelConditions.sharedInstance.get()[ModelConditions.CONDITION_KEY.SEX.rawValue] as! String?
    }
    
}
