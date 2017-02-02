//
//  TagInputTableViewCell.swift
//  GolfWear
//
//  Created by DaichiSaito on 2017/01/31.
//  Copyright © 2017年 DaichiSaito. All rights reserved.
//

import UIKit

class TagInputTableViewCell: UITableViewCell {

    @IBAction func addButtonAction(_ sender: Any) {
        TagsModel.sharedInstance.tags.append(self.tagTextField.text!)
        self.tagTextField.text = nil
    }
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var tagTextField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func setCells(indexPath: IndexPath) {
        addButton.isHidden = true
    }
    
}
