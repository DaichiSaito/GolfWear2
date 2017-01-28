//
//  AgeTableViewCell.swift
//  GolfWear
//
//  Created by DaichiSaito on 2017/01/14.
//  Copyright © 2017年 DaichiSaito. All rights reserved.
//

import UIKit

class AgeTableViewCell: UITableViewCell {

    @IBOutlet weak var ageLabel: UILabel!
    
    private var _inputView: UIView?
    override var inputView: UIView? {
        get {
            return _inputView
        }
        set {
            _inputView = newValue
        }
    }
    
    private var _inputAccessoryView: UIView?
    override var inputAccessoryView: UIView? {
        get {
            return _inputAccessoryView
        }
        set {
            _inputAccessoryView = newValue
        }
    }
    
    override var canBecomeFirstResponder: Bool { get { return true } }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func setCells(indexPath: IndexPath) {
        
        setViews()
    }
    
    func setViews() {
        
        self.ageLabel.text = ModelConditions.sharedInstance.get()[ModelConditions.CONDITION_KEY.AGE.rawValue] as! String?
    }
    
}
