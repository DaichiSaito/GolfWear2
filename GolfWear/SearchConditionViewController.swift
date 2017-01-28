//
//  SearchConditionViewController.swift
//  GolfWear
//
//  Created by DaichiSaito on 2017/01/10.
//  Copyright © 2017年 DaichiSaito. All rights reserved.
//

import UIKit

class SearchConditionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    /* セクションのインデックス */
    let SECTION_MODEL: Int = 0 // モデル情報
    let SECTION_COLOR: Int = 1 // カラー情報
    let SECTION_BRAND: Int = 2 // ブランド情報
    let SECTION_OTHER: Int = 3 // その他情報
    /* rowのインデックス */
    let ROW_SEX: Int = 0        // 性別
    let ROW_TALL: Int = 1       // 身長
    let ROW_AGE: Int = 2        // 年齢
    let ROW_TOPS: Int = 0       // トップス
    let ROW_PANTS: Int = 1      // パンツ
    let ROW_OUTER: Int = 2      // アウター
    let ROW_SHOSE: Int = 3      // シューズ
    let ROW_HAT: Int = 4        // 帽子
    let ROW_NECK: Int = 5       // ネックウォーマ
    let ROW_OTHER: Int = 6      // その他
    let ROW_BRAND_ADD: Int = 0  // ブランド
    let ROW_BRAND_LIST: Int = 1 // ブランド一覧
    let ROW_SEASON: Int = 0     // 季節
    
    /* テキストフィールド格納用 */
    var tallTextField : UITextField? // 身長用
    var ageTextField : UITextField?  // 年齢用
    
    /* 削除ボタン押下時 */
    @IBAction func deleteBtn(_ sender: UIButton) {
        
        // IndexPathを取得 (押されたボタンが乗っているCellから)
        let cell = sender.superview?.superview as? UITableViewCell
        let indexPath = self.tableView.indexPath( for: cell! )
        
        // Cellの削除処理
        self.tableView.beginUpdates()
        self.tableView.deleteRows(at: [indexPath!], with: UITableViewRowAnimation.fade)
        self.labelBrandArray.removeObject(at: indexPath!.row)
        self.tableView.endUpdates()
    }

    /* 追加ボタン押下時 */
    @IBAction func addBtn(_ sender: Any) {
//        let indexPath = IndexPath(row: labelBrandArray.count, section: 2)
//        labelBrandArray.add("一旦仮")
//        self.tableView.insertRows(at: [indexPath], with: .automatic)
//        print("追加終了")
    }

    /* テーブルビュー */
    @IBOutlet weak var tableView: UITableView!
    
    /* Sectionのタイトル */
    let sectionTitle: NSArray = ["モデル情報", "カラー", "ブランド","その他"]
    /* section毎の表示文字配列 */
    let labelModelArray: NSArray = ["性別","身長","年齢"]
    let labelItemColorArray: NSArray = ["トップス","パンツ・スカート","アウター","シューズ","帽子","ネックウォーマー","その他"]
    let labelBrandArray: NSMutableArray = []
    let labelOtherArray: NSMutableArray = ["シーズン"]
    /* セル識別子 */
    let cellIdentifier: [[String]] = [["tableCellSex","tableCellTall","tableCellAge"], // モデル情報
                                   ["tableCellItems"], // カラー情報
                                   ["tableCellBrandAdd"],
                                   ["tableCellSeason"]] // ブランド情報

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
        // ModelConditions.conditionの変更を監視
        ModelConditions.sharedInstance.addObserver(self, forKeyPath: "condition", options: .new, context: nil)
        // 条件取得
        ModelConditions.sharedInstance.getCondition()
        // セクションが上手く上部に来てくれるように
        self.automaticallyAdjustsScrollViewInsets = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // ModelCondition.conditionを監視 変更があったら再描画
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        NSLog("Called:" + keyPath!)
        tableView.reloadData()
    }
    
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
        
        return getTableCellCount(section: section)
    }
    // TableViewのセル数を返却
    func getTableCellCount(section: Int) -> Int {
        if section == SECTION_MODEL {
            return labelModelArray.count
        }
        else if section == SECTION_COLOR {
            return labelItemColorArray.count
        }
        else if section == SECTION_BRAND {
            return labelBrandArray.count + 1
        }
        else if section == SECTION_OTHER {
            return labelOtherArray.count
        }
        else{
            return 0
        }
    }
    
    //各セルの要素を設定する
    func tableView(_ table: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellIdentifier: String? = nil
        let cell: UITableViewCell?
        
        if (indexPath.section == SECTION_MODEL) {
            if (indexPath.row == ROW_SEX) {
                cellIdentifier = self.cellIdentifier[indexPath.section][indexPath.row]
                cell = table.dequeueReusableCell(withIdentifier: cellIdentifier!, for: indexPath)
                
                let label = cell?.viewWithTag(2) as! UILabel
                label.text = ModelConditions.sharedInstance.get()[ModelConditions.CONDITION_KEY.SEX.rawValue] as! String?
                
            } else {
                cellIdentifier = self.cellIdentifier[indexPath.section][indexPath.row]
                cell = table.dequeueReusableCell(withIdentifier: cellIdentifier!, for: indexPath)
                let textField = cell?.viewWithTag(2) as! UITextField
                textField.delegate = self
                if (indexPath.row == ROW_TALL) {
                    self.tallTextField = textField
                } else if (indexPath.row == ROW_AGE) {
                    self.ageTextField = textField
                }
                
                var closeToolBar: UIToolbar!
                //closeToolBar作成。ニョキ担当
                closeToolBar = UIToolbar(frame: CGRect(x: 0, y: self.view.frame.size.height/6, width: self.view.frame.size.width, height: 40.0))
                closeToolBar.barStyle = UIBarStyle.default
                closeToolBar.sizeToFit()
                
                // closeの文字を右側に表示させるためのスペーサー
                let spacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: self, action: nil)
                
                // ToolBar閉じるボタンを追加
                let myToolBarButton = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(SearchConditionViewController.onClick(_:)))
                
                if (indexPath.row == ROW_TALL) {
                    myToolBarButton.tag = 1
                } else if (indexPath.row == ROW_AGE) {
                    myToolBarButton.tag = 2
                }
                closeToolBar.items = [spacer, myToolBarButton]
                
                textField.inputAccessoryView = closeToolBar
            }
            
        } else if (indexPath.section == SECTION_COLOR) {
            cellIdentifier = "tableCellItems"
            cell = table.dequeueReusableCell(withIdentifier: cellIdentifier!, for: indexPath)
            
            let label = cell?.viewWithTag(1) as! UILabel
            label.text = "\(labelItemColorArray[indexPath.row])"
            
            let view = cell?.viewWithTag(2)
            view?.backgroundColor = ModelConditions.sharedInstance.get()[ModelConditions.CONDITION_KEY_ARRAY[indexPath.row].rawValue] as! UIColor?
            
        } else if (indexPath.section == SECTION_BRAND) {
            if (indexPath.row == ROW_BRAND_ADD) {
                cellIdentifier = "tableCellBrandAdd"
            } else {
                cellIdentifier = "tableCellBrand"
            }
            cell = table.dequeueReusableCell(withIdentifier: cellIdentifier!, for: indexPath)
            
            if (indexPath.row != ROW_BRAND_ADD) {
                // Tag番号 2 で UILabel インスタンスの生成
                let label = cell?.viewWithTag(1) as! UILabel
                label.text = ModelConditions.sharedInstance.get()[ModelConditions.CONDITION_KEY.BRANDITEMS.rawValue] as! String?
            }
            
        } else if (indexPath.section == SECTION_OTHER) {
            if (indexPath.row == ROW_SEASON) {
                cellIdentifier = "tableCellSeason"
            }
            cell = table.dequeueReusableCell(withIdentifier: cellIdentifier!, for: indexPath)
        } else {
            cell = nil
        }
        return cell!
    }
    
    //データ選択後に呼び出されるメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if (indexPath.section == SECTION_MODEL) {
            if (indexPath.row == ROW_SEX) {
                let alert: UIAlertController = UIAlertController(title: "性別", message: "性別を選択してください。", preferredStyle:  UIAlertControllerStyle.actionSheet)
                // MENボタン
                let action_MEN: UIAlertAction = UIAlertAction(title: "MEN", style: UIAlertActionStyle.default, handler:{
                    (action: UIAlertAction!) -> Void in
                    print("MEN")
                    var a = ModelConditions.sharedInstance.get()
                    a.updateValue("MEN" as AnyObject, forKey: ModelConditions.CONDITION_KEY.SEX.rawValue)
                    ModelConditions.sharedInstance.set(condition: a)
                    
                })
                let action_WOMEN: UIAlertAction = UIAlertAction(title: "WOMEN", style: UIAlertActionStyle.default, handler:{
                    (action: UIAlertAction!) -> Void in
                    print("WOMEN")
                    var a = ModelConditions.sharedInstance.get()
                    a.updateValue("WOMEN" as AnyObject, forKey: ModelConditions.CONDITION_KEY.SEX.rawValue)
                    ModelConditions.sharedInstance.set(condition: a)
                })
                
                // Cancelボタン
                let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: UIAlertActionStyle.cancel, handler:{
                    (action: UIAlertAction!) -> Void in
                    print("cancelAction")
                })
                
                alert.addAction(cancelAction)
                alert.addAction(action_MEN)
                alert.addAction(action_WOMEN)
                
                present(alert, animated: true, completion: nil)
                
            } else if (indexPath.row == ROW_TALL) {
                self.tallTextField?.becomeFirstResponder()
                
            } else if (indexPath.row == ROW_AGE) {
                self.ageTextField?.becomeFirstResponder()
            }
        } else if (indexPath.section == SECTION_COLOR) {
            
        } else if (indexPath.section == SECTION_BRAND) {
            
        } else if (indexPath.section == SECTION_OTHER) {
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segueToColorChoose") {
            let controller = segue.destination as! ColorChooseViewController
            let cell = sender as! UITableViewCell
            controller.selectedIndexPath = self.tableView.indexPath( for: cell )
            
        }
            else if (segue.identifier == "segueToBrandChoose") {
            
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        
        // キーボードを閉じる
        textField.resignFirstResponder()
        
        return true
    }
    
    //閉じる
    func onClick(_ sender: UIBarButtonItem) {
        if (sender.tag == 1) {
            var a = ModelConditions.sharedInstance.get()
            a.updateValue(self.tallTextField!.text as AnyObject, forKey: ModelConditions.CONDITION_KEY.TALL.rawValue)
            ModelConditions.sharedInstance.set(condition: a)
        } else if (sender.tag == 2) {
            var a = ModelConditions.sharedInstance.get()
            a.updateValue(self.ageTextField!.text as AnyObject, forKey: ModelConditions.CONDITION_KEY.AGE.rawValue)
            ModelConditions.sharedInstance.set(condition: a)
        }
        self.tallTextField?.resignFirstResponder()
        self.ageTextField?.resignFirstResponder()
//        self.averageCostTextField.resignFirstResponder()
    }

}
