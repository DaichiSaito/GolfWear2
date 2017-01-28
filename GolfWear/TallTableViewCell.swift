//
//  TallTableViewCell.swift
//  GolfWear
//
//  Created by DaichiSaito on 2017/01/14.
//  Copyright © 2017年 DaichiSaito. All rights reserved.
//

import UIKit

class TallTableViewCell: UITableViewCell {

    
    @IBOutlet weak var tallLabel: UILabel!
    var tallPicker = UIPickerView()
    
    var delegate: SearchViewController?
    
    var isViewSetup: Bool = false
    
//    required init(coder aDecoder: NSCoder)
//    {
//        super.init(coder: aDecoder)!
//    }
    
//    override init(style: UITableViewCellStyle, reuseIdentifier: String!)
//    {
//        //First Call Super
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        
////        titleLabel = UILabel(frame: CGRectMake(10, 2, 300, 15));
////        titleLabel.text = "";
////        titleLabel.font = UIFont.systemFontOfSize(12)
////        self.addSubview(titleLabel);
////        
////        contentLabel = UILabel(frame: CGRectMake(10, 20, 300, 15));
////        contentLabel.text = "";
////        contentLabel.font = UIFont.systemFontOfSize(22)
////        self.addSubview(contentLabel);
//    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
//        tallPicker = UIPickerView()
//        tallPicker.showsSelectionIndicator = true
////        tallPicker.delegate = self
////        tallPicker.dataSource = dataSource
//        tallPicker.tag = 1
//        
//        //closeToolBar作成。ニョキ担当
//        let closeToolBar = UIToolbar(frame: CGRect(x: 0, y: self.frame.size.height/6, width: self.frame.size.width, height: 40.0))
//        closeToolBar.barStyle = UIBarStyle.default
//        closeToolBar.sizeToFit()
//        
//        // closeの文字を右側に表示させるためのスペーサー
//        let spacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: self, action: nil)
//        
//        // ToolBar閉じるボタンを追加
//        let myToolBarButton = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(SearchViewController.onClick(_:)))
//        myToolBarButton.tag = 1
//        closeToolBar.items = [spacer, myToolBarButton]
//        
//        // 身長用TexeFieldに閉じるボタンを追加
////        self.tallTextField = (cell as? TallTableViewCell)?.tallTextField
//        tallTextField.inputView = tallPicker
//        tallTextField.inputAccessoryView = closeToolBar

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func setCells(indexPath: IndexPath) {
        
        setViews()
    }
    
//    func setDelegate(delegate: UIPickerViewDelegate) {
//        self.tallPicker.delegate = delegate
//    }
//    func setDataSource(dataSource: UIPickerViewDataSource) {
//        self.tallPicker.dataSource = dataSource
//    }
    
    func setViews() {
//        if !isViewSetup {
//            isViewSetup = true
////            tallPicker = UIPickerView()
//            tallPicker.showsSelectionIndicator = true
////            tallPicker.delegate = self
////            tallPicker.dataSource = dataSource
//            tallPicker.tag = 1
//            
//            //closeToolBar作成。ニョキ担当
//            let closeToolBar = UIToolbar(frame: CGRect(x: 0, y: self.frame.size.height/6, width: self.frame.size.width, height: 40.0))
//            closeToolBar.barStyle = UIBarStyle.default
//            closeToolBar.sizeToFit()
//            
//            // closeの文字を右側に表示させるためのスペーサー
//            let spacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: self, action: nil)
//            
//            // ToolBar閉じるボタンを追加
//            let myToolBarButton = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(SearchViewController.onClick(_:)))
//            myToolBarButton.tag = 1
//            closeToolBar.items = [spacer, myToolBarButton]
//            
//            
//            self.inputView = tallPicker
//            self.inputAccessoryView = closeToolBar
//            print("せっとあっぷしました")
//        }
//        tallPicker = UIPickerView()
//        tallPicker.showsSelectionIndicator = true
////        tallPicker.delegate = delegate
//        tallPicker.tag = 1
//
//        //closeToolBar作成。ニョキ担当
//        let closeToolBar = UIToolbar(frame: CGRect(x: 0, y: self.frame.size.height/6, width: self.frame.size.width, height: 40.0))
//        closeToolBar.barStyle = UIBarStyle.default
//        closeToolBar.sizeToFit()
//        
//        // closeの文字を右側に表示させるためのスペーサー
//        let spacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: self, action: nil)
//        
//        // ToolBar閉じるボタンを追加
//        let myToolBarButton = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(self.close(_:)))
//        myToolBarButton.tag = 1
//        closeToolBar.items = [spacer, myToolBarButton]
//        
//        // 地域１に閉じるボタンを追加
//        self.tallTextField.inputView = tallPicker
//        self.tallTextField.inputAccessoryView = closeToolBar
        self.tallLabel.text = ModelConditions.sharedInstance.get()[ModelConditions.CONDITION_KEY.TALL.rawValue] as! String?
//        var a = ModelConditions.sharedInstance.get()
//        a.updateValue("MEN" as AnyObject, forKey: ModelConditions.CONDITION_KEY.SEX.rawValue)
//        ModelConditions.sharedInstance.set(condition: a)
        
        
    }
    
//    func close(_ sender: UIButton) {
//        self.tallLabel.resignFirstResponder()
//    }
    
    
    private var _inputView: UIView?
    override var inputView: UIView? {
        get {
            return _inputView
        }
        set {
            _inputView = newValue
        }
    }
    
    private var _inputAccessoryView: UIView?
    override var inputAccessoryView: UIView? {
        get {
            return _inputAccessoryView
        }
        set {
            _inputAccessoryView = newValue
        }
    }
    
    override var canBecomeFirstResponder: Bool { get { return true } }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        self.layer.cornerRadius = self.bounds.size.height / 2.0
//        self.layer.masksToBounds = true
    }
    
}
