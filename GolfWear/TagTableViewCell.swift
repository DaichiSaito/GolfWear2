//
//  TagTableViewCell.swift
//  GolfWear
//
//  Created by DaichiSaito on 2017/01/31.
//  Copyright © 2017年 DaichiSaito. All rights reserved.
//

import UIKit

class TagTableViewCell: UITableViewCell {

    @IBOutlet weak var tagName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func setCells(indexPath: IndexPath) {
        self.tagName.text = TagsModel.sharedInstance.tags[indexPath.row - 1]
    }
    
}
