//
//  TableViewCellModel.swift
//  GolfWear
//
//  Created by DaichiSaito on 2017/01/13.
//  Copyright © 2017年 DaichiSaito. All rights reserved.
//

import UIKit

class TableViewCellModel: NSObject, UITableViewDataSource {
    
    
    let seasons: NSArray = ["春", "夏", "秋", "冬"]
    
    
    // Table Viewのセルの数を指定
    func tableView(_ table: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return seasons.count
    }
    
    //各セルの要素を設定する
    func tableView(_ table: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "seasonCell", for: indexPath) as! SeasonTableViewCell
        cell.season.text = seasons[indexPath.row] as? String
        cell.tintColor = UIColor.gray
        return cell
    }
    
    
//    //データ選択後に呼び出されるメソッド
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        //        let cell = tableView.dequeueReusableCell(withIdentifier: "brandCell", for: indexPath) as! BrandTableViewCell
//        let cell = tableView.cellForRow(at: indexPath) as! BrandTableViewCell
//        let brandName = cell.brandName.text
//        
//        let count = (self.navigationController?.viewControllers.count)! - 2
//        let vcA = self.navigationController?.viewControllers[count] as! SearchConditionViewController
//        vcA.labelBrandArray.add(brandName)
//        var a = ModelConditions.sharedInstance.get()
//        a.updateValue(brandName as AnyObject, forKey: ModelConditions.CONDITION_KEY.BRANDITEMS.rawValue)
//        ModelConditions.sharedInstance.set(condition: a)
//        
//        self.navigationController?.popViewController(animated: true)
//    }

}
