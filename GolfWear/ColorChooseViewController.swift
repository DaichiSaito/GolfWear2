//
//  ColorChooseViewController.swift
//  GolfWear
//
//  Created by DaichiSaito on 2017/01/11.
//  Copyright © 2017年 DaichiSaito. All rights reserved.
//

import UIKit

class ColorChooseViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var selectedIndexPath: IndexPath?
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBAction func doneBtn(_ sender: Any) {
        
        
    }
    
    
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
    
    /* 選択中の色を保持する変数 */
    var selectedColors: NSMutableArray = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
//        let nib = UINib(nibName: "BrandSearchView", bundle: nil)
//        let brandView = nib.instantiate(withOwner: nil, options: nil)[0] as! BrandSearchView
//        self.view.addSubview(brandView)
//        var nib2 = UINib(nibName: "BrandTableViewCell", bundle: nil)
//        brandView.tableView.register(nib2, forCellReuseIdentifier: "brandCell")
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
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // 2カラム
        let width: CGFloat = super.view.frame.width / 5 - 2
        let height: CGFloat = width
        
        return CGSize(width: width, height: height) // The size of one cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("collectionViewの設定開始")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "colorCell", for: indexPath as IndexPath)
        
        let view = cell.viewWithTag(1)
        let label = cell.viewWithTag(2) as! UILabel
        
        view?.backgroundColor = colors[indexPath.row].color
        label.text = colors[indexPath.row].colorText
        
        return cell
    }
    
    // セルの数を返す
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.colors.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
//        var a = ModelConditions.sharedInstance.get()
//        a.updateValue(colors[indexPath.row].color, forKey: ModelConditions.CONDITION_KEY_ARRAY[(self.selectedIndexPath?.row)!].rawValue)
//        ModelConditions.sharedInstance.set(condition: a)
        
//        if selectedColors.contains(indexPath) {
//            selectedColors.remove(indexPath)
//        } else {
//            selectedColors.add(indexPath)
//        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "colorCell", for: indexPath) as! ColorCollectionViewCell
        cell.updateSelecedStatus()
        
        
//        if (myNavigationItem.rightBarButtonItem!.title! == "選択") {
//            // ナビゲーションタイトルが"選択"の場合
//            print("didSelectedだがdeselectにします。")
//            // 右上ボタンのタイトルが"選択"の時は、セルを押下したとしても選択状態にしないでリターン
//            collectionView.deselectItemAtIndexPath((indexPath), animated: true)
//            return
//        } else {
//            // ナビゲーションタイトルが"選択"以外の場合
//            let cell = collectionView.cellForItemAtIndexPath(indexPath) as! MyCollectionViewCell2
//            // チェックイメージを表示
//            cell.checkImageView.hidden = false
//            // チェック配列に追加
//            checkArray.addObject(indexPath)
//            // 削除ボタンの活性化
//            deleteBtn.enabled = true
//            deleteBtn.alpha = 1.0
//        }
        
//        _ = self.navigationController?.popViewController(animated: true)
    }

}
