//
//  ColorCollectionViewCell2.swift
//  GolfWear
//
//  Created by DaichiSaito on 2017/01/23.
//  Copyright © 2017年 DaichiSaito. All rights reserved.
//

import UIKit

class ColorCollectionViewCell2: UICollectionViewCell {
    
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var colorText: UILabel!
    
    @IBOutlet weak var checkImageView: UIImageView!
    
    var myRow: Int?
    var colors = [
        Colors(color: UIColor.white, colorText: "ホワイト系"),
        Colors(color: UIColor.black, colorText: "ブラック系"),
        Colors(color: UIColor.gray, colorText: "グレー系"),
        Colors(color: UIColor.brown, colorText: "ブラウン系"),
        //        Colors(color: UIColor.brown, colorText: "ベージュ系"),
        Colors(color: UIColor.green, colorText: "グリーン系"),
        Colors(color: UIColor.blue, colorText: "ブルー系"),
        Colors(color: UIColor.purple, colorText: "パープル系"),
        Colors(color: UIColor.yellow, colorText: "イエロー系"),
        Colors(color: UIColor.magenta, colorText: "ピンク系"),
        Colors(color: UIColor.red, colorText: "レッド系"),
        Colors(color: UIColor.orange, colorText: "オレンジ系"),
        //        Colors(color: UIColor., colorText: "シルバー系"),
        //        Colors(color: UIColor., colorText: "ゴールド系"),
    ]
    
    func setCells(at indexPath: IndexPath) {
        // バックグランドカラー
        self.colorView.backgroundColor = colors[indexPath.row].color
        // ラベル
        self.colorText.text = colors[indexPath.row].colorText
        // チェックマーク
        if isSelected {
            self.checkImageView.isHidden = false
        } else {
            self.checkImageView.isHidden = true
        }
        self.myRow = indexPath.row
        
    }
    
//    private var _isSelected: Bool = false
    override var isSelected: Bool {
        didSet {
//            self.colorView.alpha = isSelected ? 0.4 : 1.0
            if isSelected {
                print("selected")
                self.checkImageView.isHidden = false
            } else {
                print("deselected")
                self.checkImageView.isHidden = true
            }
        }
    }

    
}
