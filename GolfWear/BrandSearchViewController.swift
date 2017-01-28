//
//  BrandSearchViewController.swift
//  GolfWear
//
//  Created by DaichiSaito on 2017/01/13.
//  Copyright © 2017年 DaichiSaito. All rights reserved.
//

import UIKit

class BrandSearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    /* Brand名 仮で固定にだす */
    let brandNames: NSArray = ["NIKE", "CallaWay", "アディダス"]
    override func loadView() {
        let nib = UINib(nibName: "BrandSearchView", bundle: nil)
        self.view = nib.instantiate(withOwner: nil, options: nil)[0] as! BrandSearchView
        
        
        
//        var nib2 = UINib(nibName: "BrandTableViewCell", bundle: nil)
//        var view = nib.instantiate(withOwner: nil, options: nil)[0] as! BrandSearchView
//        view.tableView.register(nib2, forCellReuseIdentifier: "brandCell")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let brandView = self.view as! BrandSearchView
        brandView.tableView.delegate = self
        brandView.tableView.dataSource = self
        
        
        var nib = UINib(nibName: "BrandTableViewCell", bundle: nil)
//        var view = nib.instantiate(withOwner: nil, options: nil)[0] as! BrandSearchView
        brandView.tableView.register(nib, forCellReuseIdentifier: "brandCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    // Table Viewのセルの数を指定
    func tableView(_ table: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return brandNames.count
    }
    
    //各セルの要素を設定する
    func tableView(_ table: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "brandCell", for: indexPath) as! BrandTableViewCell
        cell.brandName.text = brandNames[indexPath.row] as? String
        return cell
    }
    
    //データ選択後に呼び出されるメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "brandCell", for: indexPath) as! BrandTableViewCell
        let cell = tableView.cellForRow(at: indexPath) as! BrandTableViewCell
        let brandName = cell.brandName.text
        
        let count = (self.navigationController?.viewControllers.count)! - 2
        let vcA = self.navigationController?.viewControllers[count] as! SearchConditionViewController
        vcA.labelBrandArray.add(brandName)
        var a = ModelConditions.sharedInstance.get()
        a.updateValue(brandName as AnyObject, forKey: ModelConditions.CONDITION_KEY.BRANDITEMS.rawValue)
        ModelConditions.sharedInstance.set(condition: a)
        
        self.navigationController?.popViewController(animated: true)
    }


}
