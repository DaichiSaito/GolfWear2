//
//  ToukouIchiranViewController.swift
//  GolfWear
//
//  Created by DaichiSaito on 2017/01/08.
//  Copyright © 2017年 DaichiSaito. All rights reserved.
//

import UIKit

class ToukouIchiranViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    dynamic var imageInfo = [] as NSArray
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //        let ichiranView = self.view as! IchiranView
        // デリゲート設定
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.addObserver(self, forKeyPath: "imageInfo", options: [.new, .old], context: nil)
        self.loadImageData()
    }
    deinit {
        //        let notificationCenter = NSNotificationCenter.defaultCenter()
        //        notificationCenter.removeObserver(self, name: "com.hogehoge.someNotification", object: nil)
        self.removeObserver(self, forKeyPath: "imageInfo")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        NSLog("Called:" + keyPath!)
        if (keyPath == "imageInfo") {
            self.collectionView.reloadData()
        }
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
        let width: CGFloat = super.view.frame.width / 2 - 2
        let height: CGFloat = width
        
        return CGSize(width: width, height: height) // The size of one cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("collectionViewの設定開始")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath as IndexPath) as! MyCollectionViewCell
        
        let url = URL(string: (imageInfo[indexPath.row] as AnyObject).object(forKey: "imagePath") as! String)
        let req = URLRequest(url:url!)
        NSURLConnection.sendAsynchronousRequest(req, queue:OperationQueue.main){(res, data, err) in
            let image = UIImage(data:data!)
            // 画像に対する処理 (UcellのUIImageViewに表示する等)
            let imageView = UIImageView()
            imageView.frame = CGRect(x: 0,y: 0,width: cell.frame.size.width,height: cell.frame.size.height)
            imageView.image = image
            cell.addSubview(imageView)
        }
        
        return cell
    }
    
    // セルの数を返す
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imageInfo.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    //データのリロード
    func loadImageData() {
        
        /**
         * Just FYI
         *
         * Example: 文字列と一致する場合
         * query.whereKey("title", equalTo: "xxx")
         *
         * メソッドのインターフェイスについて:
         * NCMBQuery.hを参照するとNCMBQueryのインスタンスメソッドの引数にとるべき値等が見れます。
         *
         */
        var query: NCMBQuery?
        query = NCMBQuery(className: "WEARIMAGE")
        query!.findObjectsInBackground({(objects, error) in
            
            if error == nil {
                
                if (objects?.count)! > 0 {
                    
                    self.imageInfo = objects! as NSArray
                    
                    //コレクションビューをリロードする
                    //                    self.collectionView!.reloadData()
                } else {
                    print("[]を入れる必要がある？")
//                    self.imageInfo = []
                }
                
            } else {
                print("エラー")
                print(error?.localizedDescription)
                //                self.connectionErrorFlg = true
            }
        })
        
    }
}
