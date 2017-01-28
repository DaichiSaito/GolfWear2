//
//  Season2TableViewCell.swift
//  GolfWear
//
//  Created by DaichiSaito on 2017/01/14.
//  Copyright © 2017年 DaichiSaito. All rights reserved.
//

import UIKit

extension UIColor {
    class func rgb(r: Int, g: Int, b: Int, alpha: CGFloat) -> UIColor{
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
    }
    class func MainColor() -> UIColor {
        return UIColor.rgb(r: 24, g: 135, b: 208, alpha: 1.0)
    }
}

class Season2TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var springBtn: UIButton!
    @IBOutlet weak var summerBtn: UIButton!
    @IBOutlet weak var autumnBtn: UIButton!
    @IBOutlet weak var winterBtn: UIButton!
    
    var springBtnState: Bool = false
    var summerBtnState: Bool = false
    var autumnBtnState: Bool = false
    var winterBtnState: Bool = false
    
    @IBAction func springBtnAction(_ sender: UIButton) {
        // 押されたボタンの色を反転
        let tmpCurrentTitleColor:UIColor = sender.currentTitleColor
        if let tmpCurrentBackGroundColor:UIColor = sender.backgroundColor {
            sender.backgroundColor = tmpCurrentTitleColor
            sender.setTitleColor(tmpCurrentBackGroundColor, for: UIControlState.normal)
        } else {
            sender.backgroundColor = tmpCurrentTitleColor
            sender.setTitleColor(UIColor.white, for: UIControlState.normal)
        }
        
        springBtnState = !springBtnState
    }
    @IBAction func summerBtnAction(_ sender: UIButton) {
        // 押されたボタンの色を反転
        let tmpCurrentTitleColor:UIColor = sender.currentTitleColor
        if let tmpCurrentBackGroundColor:UIColor = sender.backgroundColor {
            sender.backgroundColor = tmpCurrentTitleColor
            sender.setTitleColor(tmpCurrentBackGroundColor, for: UIControlState.normal)
        } else {
            sender.backgroundColor = tmpCurrentTitleColor
            sender.setTitleColor(UIColor.white, for: UIControlState.normal)
        }
        
        summerBtnState = !summerBtnState
    }
    @IBAction func autumnBtnAction(_ sender: UIButton) {
        // 押されたボタンの色を反転
        let tmpCurrentTitleColor:UIColor = sender.currentTitleColor
        if let tmpCurrentBackGroundColor:UIColor = sender.backgroundColor {
            sender.backgroundColor = tmpCurrentTitleColor
            sender.setTitleColor(tmpCurrentBackGroundColor, for: UIControlState.normal)
        } else {
            sender.backgroundColor = tmpCurrentTitleColor
            sender.setTitleColor(UIColor.white, for: UIControlState.normal)
        }
        
        autumnBtnState = !autumnBtnState
    }
    @IBAction func winterBtnAction(_ sender: UIButton) {
        // 押されたボタンの色を反転
        let tmpCurrentTitleColor:UIColor = sender.currentTitleColor
        if let tmpCurrentBackGroundColor:UIColor = sender.backgroundColor {
            sender.backgroundColor = tmpCurrentTitleColor
            sender.setTitleColor(tmpCurrentBackGroundColor, for: UIControlState.normal)
        } else {
            sender.backgroundColor = tmpCurrentTitleColor
            sender.setTitleColor(UIColor.white, for: UIControlState.normal)
        }
        
        winterBtnState = !winterBtnState
    }
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func setCells(indexPath: IndexPath) {
        // 以下2行が丸くする処理
        springBtn.layer.cornerRadius = 15.0 //どれくらい丸くするのか
        springBtn.layer.masksToBounds = true //viewに丸くする許可を出す
        springBtn.layer.borderColor = self.tintColor.cgColor
        springBtn.layer.borderWidth = 1
        summerBtn.layer.cornerRadius = 15.0 //どれくらい丸くするのか
        summerBtn.layer.masksToBounds = true //viewに丸くする許可を出す
        summerBtn.layer.borderColor = self.tintColor.cgColor
        summerBtn.layer.borderWidth = 1
        autumnBtn.layer.cornerRadius = 15.0 //どれくらい丸くするのか
        autumnBtn.layer.masksToBounds = true //viewに丸くする許可を出す
        autumnBtn.layer.borderColor = self.tintColor.cgColor
        autumnBtn.layer.borderWidth = 1
        winterBtn.layer.cornerRadius = 15.0 //どれくらい丸くするのか
        winterBtn.layer.masksToBounds = true //viewに丸くする許可を出す
        winterBtn.layer.borderColor = self.tintColor.cgColor
        winterBtn.layer.borderWidth = 1
    }
    
}
