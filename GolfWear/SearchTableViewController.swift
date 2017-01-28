//
//  SearchTableViewController.swift
//  GolfWear
//
//  Created by DaichiSaito on 2017/01/13.
//  Copyright © 2017年 DaichiSaito. All rights reserved.
//

import UIKit

class SearchTableViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var tableViewCellModel = TableViewCellModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = tableViewCellModel
        
        
        var nib = UINib(nibName: "SeasonTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "seasonCell")
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
    
    //データ選択後に呼び出されるメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! SeasonTableViewCell

        if (cell.touchStatus) {
            cell.tintColor = UIColor.gray
        } else {
            cell.tintColor = UIColor.red
        }
        cell.touchStatus = !cell.touchStatus
        
    }

}
