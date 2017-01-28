//
//  ColorAndBrand2ViewController.swift
//  GolfWear
//
//  Created by DaichiSaito on 2017/01/28.
//  Copyright © 2017年 DaichiSaito. All rights reserved.
//

import UIKit

class ColorAndBrand2ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    var selectedBrands = [String]()
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
    /* Sectionのタイトル */
    let sectionTitle: NSArray = ["選択中ブランド"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.collectionView.dataSource = self
        self.tableView.dataSource = self
        self.collectionView.delegate = self
//        self.tableView.delegate = self
        self.automaticallyAdjustsScrollViewInsets = false
        self.textField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidLayoutSubviews() {
        self.collectionViewHeight.constant = collectionView.collectionViewLayout.collectionViewContentSize.height
//        self.tableViewHeight.constant = tableView.contentSize.height
    }
    //textviewがフォーカスされたら、Labelを非表示
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool
    {
        print("textField")
//        let offset = CGPoint(x:100,y:100)
//        self.scrollView.setContentOffset(offset, animated: true)
        let controller = self.storyboard!.instantiateViewController( withIdentifier: "searchBrandViewController" ) as! SearchBrandViewController
        //                controller.selectedIndexPath = indexPath
        self.navigationController?.pushViewController(controller, animated: false)
        return false
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension ColorAndBrand2ViewController: UICollectionViewDataSource {
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("collectionViewの設定開始")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "colorCell", for: indexPath as IndexPath)
        //        let view = cell.viewWithTag(1)
        //        let label = cell.viewWithTag(2) as! UILabel
        //        view?.backgroundColor = colors[indexPath.row].color
        //        label.text = colors[indexPath.row].colorText
        cell.backgroundColor = colors[indexPath.row].color
//        cell.setCells(at: indexPath)
        return cell
    }
    
    // セルの数を返す
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}
extension ColorAndBrand2ViewController: UICollectionViewDelegateFlowLayout {
    /* 一つのセルのサイズ設定処理 */
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // 2カラム
        let width: CGFloat = super.view.frame.width / 5
        let height: CGFloat = width
        
        return CGSize(width: width, height: height) // The size of one cell
        
    }
}
extension ColorAndBrand2ViewController: UITableViewDataSource {
    
    
    
    // Section数
    func numberOfSections(in tableView: UITableView) -> Int{
        return sectionTitle.count
    }
    // Sectionのタイトル
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section] as? String
    }
    
    // Table Viewのセルの数を指定
    func tableView(_ table: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return selectedBrands.count
        //            return selectedBrands.count
//        case 1:
//            return brands.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("tableViewの設定開始")
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "brandCell", for: indexPath as IndexPath)
            (cell.viewWithTag(1) as! UILabel).text = selectedBrands[indexPath.row]
//            cell.brandName.text = conditionBrands[indexPath.row]["name"] as? String
            //            (cell.viewWithTag(1) as! UILabel).text = selectedBrands[indexPath.row]
            return cell
//        case 1:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "brandCell", for: indexPath as IndexPath)
//            (cell.viewWithTag(1) as! UILabel).text = brands[indexPath.row]
//            return cell
        default :
            let cell = tableView.dequeueReusableCell(withIdentifier: "brandCell", for: indexPath as IndexPath)
            return cell
        }
        
    }
    
}
