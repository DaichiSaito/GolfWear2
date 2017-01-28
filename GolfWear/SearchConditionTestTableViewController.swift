//
//  SearchConditionTestTableViewController.swift
//  GolfWear
//
//  Created by DaichiSaito on 2017/01/11.
//  Copyright © 2017年 DaichiSaito. All rights reserved.
//

import UIKit

class SearchConditionTestTableViewController: UITableViewController {
    @IBOutlet weak var addBrandView: UIView!
    var brands = ["＋ね"] as NSMutableArray
    var objects = [AnyObject]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        // ネイリストボタン押下時
        addBrandView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(SearchConditionTestTableViewController.addCell(_:))))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }
//
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case 0:
            return 3
        case 1:
            return 7
        case 2:
            return brands.count
        default:
            return 0
        }
//        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.none
    }
    
//    override func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
//        // 高さが他のセクションと違うセルはここで指定する必要があります。
//        // tableView:heightForRowAtIndexPath: を実装するだけでは可変セル・セクションの高さが変わりません。
//        // tableView:heightForRowAtIndexPath: で実際の高さを返却する必要があります。
////        if indexPath.section == 1 {
////            return super.tableView(tableView, heightForRowAt, indexPath: IndexPath(row: 0, section: section))
////        }
////        else {
////            return super.tableView(tableView, heightForRowAt, indexPath: indexPath)
////        }
//    }
    func addCell(_ sender: UITapGestureRecognizer) {
        print("追加")
        
//        // myItemsに追加.
//        myItems.addObject("add Cell")
//        
//        // TableViewを再読み込み.
//        myTableView.reloadData()
        
        let indexPath = IndexPath(row: 0, section: 2)
        brands.add("あいうえお")
        self.tableView.insertRows(at: [indexPath], with: .automatic)
        print("追加終了")
    }

}
