//
//  TestViewController.swift
//  SearchController
//
//  Created by DaichiSaito on 2017/01/26.
//  Copyright © 2017年 TestOrganization. All rights reserved.
//

import UIKit

class SearchResultViewController: UITableViewController, UISearchResultsUpdating,UISearchControllerDelegate/*,UITableViewDelegate, UITableViewDataSource  */{
    
    var vc: SearchBrandViewController?
    //データ
//    var dataList = [[String(),Bool()]]
//    var dataList = [[]]
    
    //検索結果配列
    var searchResults = [String]()
//    var searchResults = [[]]
    
    //結果表示用テーブルビュー
    //    var tableView:UITableView!
    
    
    //最初からあるメソッド
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //結果表示用のテーブルビューを作成する。
        //        tableView = UITableView(frame:CGRect(x:100, y:100, width:self.view.frame.size.width, height:400))
        tableView.register(BrandTableTableViewCell3.self,forCellReuseIdentifier: "TestCell")
        //        self.view.frame = CGRect(x:0,y:400,width:self.view.frame.size.width,height:self.view.frame.size.height)
        //        tableView.dataSource = self
        //        tableView.delegate = self
        
        //        self.view.addSubview(tableView)
//        tableView.allowsMultipleSelection = true
//        self.automaticallyAdjustsScrollViewInsets = false
    }
    
    
    
    //データの個数を返すメソッド
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return BrandsModel.sharedInstance.dataList2.count
        return searchResults.count
    }
    
    
    
    //データを返すメソッド
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //セルを取得する。
        let cell = tableView.dequeueReusableCell(withIdentifier: "TestCell", for: indexPath) as! BrandTableTableViewCell3
        cell.selectionStyle = .none
        cell.textLabel!.text = searchResults[indexPath.row]
        
        if (BrandsModel.sharedInstance.dataList[searchResults[indexPath.row]])! {
            cell.accessoryType = UITableViewCellAccessoryType.checkmark
            cell.touchStatus = true
//            cell.isSelected = true
//            tableView.selectRow(at: indexPath, animated: true, scrollPosition: .middle)
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.none
//            cell.isSelected = false
//            tableView.deselectRow(at: indexPath, animated: true)
            cell.touchStatus = false
        }

        
        return cell
    }
    
    
    
    //検索文字列変更時の呼び出しメソッド
    func updateSearchResults(for
        searchController: UISearchController) {
        //        self.view.frame = CGRect(x:0,y:0,width:self.view.frame.size.width,height:self.view.frame.size.height)
        //        vc?.testTableView.frame = CGRect(x:0,y:0,width:self.view.frame.size.width,height:self.view.frame.size.height)
        //検索文字列を含むデータを検索結果配列に格納する。
        searchResults = BrandsModel.sharedInstance.dataList2.filter { data in
            return data.contains(searchController.searchBar.text!)
        }
        
        //テーブルビューを再読み込みする。
        tableView.reloadData()
    }
    
    func willPresentSearchController(_ searchController:UISearchController) {
        print("willPresentSearchController")
        //        vc?.testTableView.frame = CGRect(x:0,y:8,width:self.view.frame.size.width,height:self.view.frame.size.height)
        
    }
    func willDismissSearchController(_ searchController:UISearchController) {
        print("willDismissSearchController")
        vc?.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        let cell = tableView.cellForRow(at: indexPath) as? BrandTableTableViewCell3
        if !(cell?.touchStatus)! {
            cell?.accessoryType = UITableViewCellAccessoryType.checkmark
            let brandName = searchResults[indexPath.row]
            BrandsModel.sharedInstance.dataList[brandName] = true
            BrandsModel.sharedInstance.selectedBrands.append(brandName)
            
            
        } else {
            cell?.accessoryType = UITableViewCellAccessoryType.none
            let brandName = searchResults[indexPath.row]
            BrandsModel.sharedInstance.dataList[brandName] = false
            let index = BrandsModel.sharedInstance.selectedBrands.index(of: brandName)
            BrandsModel.sharedInstance.selectedBrands.remove(at: index!)
        }
        
        cell?.touchStatus = !(cell?.touchStatus)!
        

    }
//    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        print(indexPath.row)
//        let cell = tableView.cellForRow(at: indexPath)
//        cell?.accessoryType = UITableViewCellAccessoryType.none
//        let brandName = searchResults[indexPath.row]
//        BrandsModel.sharedInstance.dataList[brandName] = false
//        //        dataList[indexPath.row][1] = false
//    }
}
