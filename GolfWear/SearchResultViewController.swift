//
//  TestViewController.swift
//  SearchController
//
//  Created by DaichiSaito on 2017/01/26.
//  Copyright © 2017年 TestOrganization. All rights reserved.
//

import UIKit

class SearchResultViewController: UITableViewController, UISearchResultsUpdating,UISearchControllerDelegate/*,UITableViewDelegate, UITableViewDataSource  */{
    
    var vc: ViewController?
    //データ
    var dataList = [String]()
    
    //検索結果配列
    var searchResults = [String]()
    
    //結果表示用テーブルビュー
    //    var tableView:UITableView!
    
    
    //最初からあるメソッド
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //結果表示用のテーブルビューを作成する。
        //        tableView = UITableView(frame:CGRect(x:100, y:100, width:self.view.frame.size.width, height:400))
        tableView.register(UITableViewCell.self,forCellReuseIdentifier: "TestCell")
        //        self.view.frame = CGRect(x:0,y:400,width:self.view.frame.size.width,height:self.view.frame.size.height)
        //        tableView.dataSource = self
        //        tableView.delegate = self
        
        //        self.view.addSubview(tableView)
        
    }
    
    
    
    //データの個数を返すメソッド
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    
    
    //データを返すメソッド
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //セルを取得する。
        let cell = tableView.dequeueReusableCell(withIdentifier: "TestCell", for: indexPath)
        cell.textLabel!.text = searchResults[indexPath.row]
        
        return cell
    }
    
    
    
    //検索文字列変更時の呼び出しメソッド
    func updateSearchResults(for
        searchController: UISearchController) {
        //        self.view.frame = CGRect(x:0,y:0,width:self.view.frame.size.width,height:self.view.frame.size.height)
        //        vc?.testTableView.frame = CGRect(x:0,y:0,width:self.view.frame.size.width,height:self.view.frame.size.height)
        //検索文字列を含むデータを検索結果配列に格納する。
        searchResults = dataList.filter { data in
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
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
