//
//  SearchViewController.swift
//  GolfWear
//
//  Created by DaichiSaito on 2017/01/14.
//  Copyright © 2017年 DaichiSaito. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UIPickerViewDelegate, UIToolbarDelegate {
    
    var dataSource: SearchViewModel  = SearchViewModel()
    
    var selectedAge: [String] = []
    var selectedTall: [String] = []
    
    var isSetupSexAlert: Bool = false
    var isSetupTallPickUpView: Bool = false
    var isSetupAgePickUpView: Bool = false
    
    var currentSelectedCell: UITableViewCell? = nil
    
    
    override func loadView() {
        let nib = UINib(nibName: "SearchView", bundle: nil)
        self.view = nib.instantiate(withOwner: nil, options: nil)[0] as! SearchView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let searchView = self.view as! SearchView
        searchView.tableView.delegate = self
        searchView.tableView.dataSource = dataSource
        
        let seasonNib = UINib(nibName: "Season2TableViewCell", bundle: nil)
        searchView.tableView.register(seasonNib, forCellReuseIdentifier: "season2Cell")
        let itemsNib = UINib(nibName: "SearchItemsTableViewCell", bundle: nil)
        searchView.tableView.register(itemsNib, forCellReuseIdentifier: "itemsCell")
        let sexNib = UINib(nibName: "SexTableViewCell", bundle: nil)
        searchView.tableView.register(sexNib, forCellReuseIdentifier: "sexCell")
        let tallNib = UINib(nibName: "TallTableViewCell", bundle: nil)
        searchView.tableView.register(tallNib, forCellReuseIdentifier: "tallCell")
        let ageNib = UINib(nibName: "AgeTableViewCell", bundle: nil)
        searchView.tableView.register(ageNib, forCellReuseIdentifier: "ageCell")
        
        
        ModelConditions.sharedInstance.addObserver(self, forKeyPath: "condition", options: .new, context: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        ModelConditions.sharedInstance.removeObserver(self, forKeyPath: "condition")
    }
    

    // ModelCondition.conditionを監視 変更があったら再描画
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        NSLog("Called:" + keyPath!)
        let searchView = self.view as! SearchView
        searchView.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case dataSource.ROW_SEASON:
                break
//                let controller = self.storyboard!.instantiateViewController( withIdentifier: "ColorChooseViewController" ) as! ColorChooseViewController
//                self.navigationController?.pushViewController(controller, animated: true)
            case dataSource.ROW_TOPS:
                let controller = self.storyboard!.instantiateViewController( withIdentifier: "colorAndBrandViewController" ) as! ColorAndBrandViewController
//                controller.selectedIndexPath = indexPath
                self.navigationController?.pushViewController(controller, animated: true)
            case dataSource.ROW_PANTS:
                break
            case dataSource.ROW_OUTER:
                break
            case dataSource.ROW_SHOSE:
                break
            case dataSource.ROW_HAT:
                break
            case dataSource.ROW_NECK:
                break
            case dataSource.ROW_OTHER:
                break
            default:
                break
            }

        case 1:
            switch indexPath.row {
            case dataSource.ROW_SEX:
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
                    let searchView = self.view as! SearchView
                    searchView.tableView.reloadData()
                })
                
                alert.addAction(cancelAction)
                alert.addAction(action_MEN)
                alert.addAction(action_WOMEN)
                
                present(alert, animated: true, completion: nil)
                
            case dataSource.ROW_TALL:
//                let cellTall = tableView.dequeueReusableCell(withIdentifier: "tallCell", for: indexPath) as! TallTableViewCell
                let cellTall = tableView.cellForRow(at: indexPath) as! TallTableViewCell
                if !isSetupTallPickUpView {
                    isSetupTallPickUpView = true
                    let tallPicker = UIPickerView()
                    tallPicker.showsSelectionIndicator = true
                    tallPicker.delegate = self
                    tallPicker.dataSource = dataSource
                    tallPicker.tag = 1
                    
                    //closeToolBar作成。ニョキ担当
                    let closeToolBar = UIToolbar(frame: CGRect(x: 0, y: self.view.frame.size.height/6, width: self.view.frame.size.width, height: 40.0))
                    closeToolBar.barStyle = UIBarStyle.default
                    closeToolBar.sizeToFit()
                    
                    // closeの文字を右側に表示させるためのスペーサー
                    let spacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: self, action: nil)
                    
                    // ToolBar閉じるボタンを追加
                    let myToolBarButton = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(SearchViewController.onClick(_:)))
                    myToolBarButton.tag = 1
                    closeToolBar.items = [spacer, myToolBarButton]
                    
                    
                    cellTall.inputView = tallPicker
                    cellTall.inputAccessoryView = closeToolBar
                }
                DispatchQueue.main.async(execute: {
                    cellTall.becomeFirstResponder()
                });
                currentSelectedCell = cellTall
                
                
            case dataSource.ROW_AGE:
                // 年齢用PickerView作成
//                let cellAge = tableView.dequeueReusableCell(withIdentifier: "ageCell", for: indexPath) as! AgeTableViewCell
                let cellAge = tableView.cellForRow(at: indexPath) as! AgeTableViewCell
                if !isSetupAgePickUpView {
                    isSetupAgePickUpView = true
                    let agePicker = UIPickerView()
                    agePicker.showsSelectionIndicator = true
                    agePicker.delegate = self
                    agePicker.dataSource = dataSource
                    agePicker.tag = 2
                    
                    //closeToolBar作成。ニョキ担当
                    let closeToolBar = UIToolbar(frame: CGRect(x: 0, y: self.view.frame.size.height/6, width: self.view.frame.size.width, height: 40.0))
                    closeToolBar.barStyle = UIBarStyle.default
                    closeToolBar.sizeToFit()
                    
                    // closeの文字を右側に表示させるためのスペーサー
                    let spacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: self, action: nil)
                    
                    // ToolBar閉じるボタンを追加
                    let myToolBarButton = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(self.onClick(_:)))
                    myToolBarButton.tag = 2
                    closeToolBar.items = [spacer, myToolBarButton]
                    
                    
                    cellAge.inputView = agePicker
                    cellAge.inputAccessoryView = closeToolBar
                    
                }
                DispatchQueue.main.async(execute: {
                    cellAge.becomeFirstResponder()
                });
                
                
            
            default:
                break
            }
        case 2:
            switch indexPath.row {
            case dataSource.ROW_TAG_ADD:
                break
            case dataSource.ROW_TAG_LIST:
                break
            default:
                break
            }
        default:
            break
        }
    }
    
    
    
    
    /* プルダウン選択時 */
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        print("pickerView")
        if (pickerView.tag == 1) {
            selectedTall = dataSource.tallPickerDataSource[row]
        } else if (pickerView.tag == 2) {
            selectedAge = dataSource.agePickerDataSource[row]
        }
    }
    
    /* プルダウンの要素 */
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        
        //        if (component == 1) {
        //            return "〜"
        //        }
        if (pickerView.tag == 1) {
            let tall = dataSource.tallPickerDataSource[row]
            return "\(tall[0])〜\(tall[1])cm"

            
            
            
        } else if (pickerView.tag == 2) {
            let age = dataSource.agePickerDataSource[row]
            return "\(age[0])〜\(age[1])歳"
            
        } else {
            return "何らかのエラーにより取得できてません。"
        }
        
    }
    
    //閉じる
    func onClick(_ sender: UIBarButtonItem) {
        switch sender.tag {
        case 1:
            if selectedTall == [] {
                selectedTall = ["151","160"]
            }
            print("\(selectedTall[0])〜\(selectedTall[1])")
            var a = ModelConditions.sharedInstance.get()
            a.updateValue("\(selectedTall[0])〜\(selectedTall[1])cm" as AnyObject, forKey: ModelConditions.CONDITION_KEY.TALL.rawValue)
            ModelConditions.sharedInstance.set(condition: a)
            ModelConditions.sharedInstance.set(condition: a)
            
//            DispatchQueue.main.async(execute: {
//                self.currentSelectedCell?.resignFirstResponder()
//            });
            
            
        case 2:
            if selectedAge == [] {
                selectedAge = ["0","10"]
            }
            print("\(selectedAge[0])〜\(selectedAge[1])")
            //            return "\(age[0])歳〜\(age[1])歳"
            var a = ModelConditions.sharedInstance.get()
            a.updateValue("\(selectedAge[0])〜\(selectedAge[1])歳" as AnyObject, forKey: ModelConditions.CONDITION_KEY.AGE.rawValue)
            ModelConditions.sharedInstance.set(condition: a)
            
        default:break
        }
        
        
        
//        self.averageCostTextField.resignFirstResponder()
    }

}
