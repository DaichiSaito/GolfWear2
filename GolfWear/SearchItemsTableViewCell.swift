//
//  SearchItemsTableViewCell.swift
//  GolfWear
//
//  Created by DaichiSaito on 2017/01/14.
//  Copyright © 2017年 DaichiSaito. All rights reserved.
//

import UIKit

class SearchItemsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var selectedColor1: UIView!
    @IBOutlet weak var selectedColor2: UIView!
    @IBOutlet weak var selectedColor3: UIView!
    @IBOutlet weak var overLabelForColor: UILabel!
    @IBOutlet weak var overLabelForBrand: UILabel!
    @IBOutlet weak var selectedBrands: UILabel!
    var selectedColorArray = [UIView]()
//    var selectedColorArray = [selectedColor1,selectedColor2,selectedColor3]
    
    let itemLabels: NSArray = ["シーズン","トップス","パンツ・スカート","アウター","シューズ","帽子","ネックウォーマー","その他"]

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func setCells(indexPath: IndexPath) {
        selectedColorArray = [selectedColor1,selectedColor2,selectedColor3]
        self.itemName.text = itemLabels[indexPath.row] as? String
        
        // 一旦全部見えなくする
        for selectedColor in selectedColorArray {
            selectedColor.isHidden = true
        }
        overLabelForColor.isHidden = true
        overLabelForBrand.isHidden = true
        // 以下2行が丸くする処理
//        selectedColor1.layer.cornerRadius = 7.5 //どれくらい丸くするのか
//        selectedColor1.layer.masksToBounds = true //viewに丸くする許可を出す
//        selectedColor1.layer.borderColor = UIColor.white.cgColor
//        selectedColor1.layer.borderWidth = 1
//        selectedColor2.layer.cornerRadius = 7.5 //どれくらい丸くするのか
//        selectedColor2.layer.masksToBounds = true //viewに丸くする許可を出す
//        selectedColor2.layer.borderColor = UIColor.white.cgColor
//        selectedColor2.layer.borderWidth = 1
//        selectedColor3.layer.cornerRadius = 7.5 //どれくらい丸くするのか
//        selectedColor3.layer.masksToBounds = true //viewに丸くする許可を出す
//        selectedColor3.layer.borderColor = UIColor.white.cgColor
//        selectedColor3.layer.borderWidth = 1
        
        if let itemTopConditions = ModelConditions.sharedInstance.get()[ModelConditions.CONDITION_KEY_ARRAY[indexPath.row].rawValue] as? NSArray {
//            var index: Int = 0
            for (index, itemTopCondition) in itemTopConditions.enumerated() {
                if index == 3 {
                    overLabelForColor.isHidden = false
                    break
                }
                (selectedColorArray[index]).backgroundColor = itemTopCondition as? UIColor
                (selectedColorArray[index]).layer.cornerRadius = 7.5 //どれくらい丸くするのか
                (selectedColorArray[index]).layer.masksToBounds = true //viewに丸くする許可を出す
                (selectedColorArray[index]).layer.borderColor = UIColor.white.cgColor
                (selectedColorArray[index]).isHidden = false
                
            }
        }
        
    }
}
