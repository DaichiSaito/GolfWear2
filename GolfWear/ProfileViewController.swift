//
//  ProfileViewController.swift
//  GolfWear
//
//  Created by DaichiSaito on 2017/01/07.
//  Copyright © 2017年 DaichiSaito. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    dynamic var imageInfo = [] as NSArray
    
    /* viewの読み込み */
//    override func loadView() {
//        let nib = UINib(nibName: "ProfileView", bundle: nil)
//        self.view = nib.instantiate(withOwner: nil, options: nil)[0] as! UIView
//    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        
        switch indexPath.section {
        case 0:
            
            let width: CGFloat = super.view.frame.width
            let height: CGFloat = width / 3 * 2
            print("width:\(width)height:\(height)")
            
            return CGSize(width: width, height: height)
            
        case 1:
            let width: CGFloat = super.view.frame.width / 2 - 2
            let height: CGFloat = width
            
            return CGSize(width: width, height: height)
            
        
            
        default:
            let width: CGFloat = super.view.frame.width / 2 - 2
            let height: CGFloat = width
            
            return CGSize(width: width, height: height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("collectionViewの設定開始")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath as IndexPath) as! MyCollectionViewCell
        
        switch indexPath.section {
            case 0:
                let nib = UINib(nibName: "ProfileView", bundle: nil)
                let view = nib.instantiate(withOwner: nil, options: nil)[0] as! ProfileView
                view.frame = CGRect(x: 0,y: 0,width: cell.frame.size.width,height: cell.frame.size.height)
                print("view.frameは\(view.frame)")
                cell.addSubview(view)
                cell.backgroundColor = UIColor.blue
                setFavBrand(view: view)
            
                return cell
            
            case 1:
            
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
            
            default:
                return cell
        
        }
//        let imageView = UIImageView()
//        imageView.frame = CGRect(x: 0,y: 0,width: cell.frame.size.width,height: cell.frame.size.height)
//        imageView.image = UIImage(named: picArray[indexPath.row])
//        cell.addSubview(imageView)
//        return cell
    }
    
    // セルの数を返す
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return self.imageInfo.count
        default:
            return 0
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
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
    
    func setFavBrand(view: ProfileView) {
        
        let tagArray = ["Nike","addidas","callaway","srixon","Kappa"] as NSArray
        let tagLabelArray: NSMutableArray = []
        var widthTotal: Int = 0
        
        
        for tag in tagArray {
            let tagLabel: UILabel = UILabel(frame: CGRect.zero)
//            let tagLabel: UILabel = UILabel(frame: CGRect(x:10, y:10, width:100, height:20))
//            tagLabel.frame = CGRect(x: 0,y: 0,width: view.frame.size.width,height: view.frame.size.height)
            tagLabelArray.add(tagLabel)
//            tagLabel.translatesAutoresizingMaskIntoConstraints = false
            tagLabel.backgroundColor = UIColor(red: 1.00, green: 0.20, blue: 0.83, alpha: 1)
            tagLabel.text = tag as? String
            tagLabel.textColor = UIColor.white
            let fontSize: CGFloat = 20.0
            tagLabel.font = UIFont.systemFont(ofSize: fontSize)
            tagLabel.sizeToFit()
            print(tagLabel.frame)
            tagLabel.frame.origin.x = CGFloat(widthTotal)
            tagLabel.frame.origin.y = view.scrollView.frame.origin.y
//            tagLabel.frame.origin.y = view.testView.center.y
            view.scrollView.addSubview(tagLabel)
            

            widthTotal += Int(tagLabel.frame.width) + 5
            
//            tagLabel.center = view.scrollView.center
//            if tagLabelArray.count == 1 {
//                tagLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5.0).isActive = true
//            } else {
//                tagLabel.leadingAnchor.constraint(equalTo: (tagLabelArray[tagLabelArray.count - 1] as AnyObject).layoutMarginsGuide.leadingAnchor, constant: 5.0).isActive = true
//            }
            
            // Topからの距離制約
//            var tagLabelTopConstraint:NSLayoutConstraint!
//            tagLabelTopConstraint = NSLayoutConstraint(item: tagLabel,
//                                                       attribute: NSLayoutAttribute.top,
//                                                       relatedBy: NSLayoutRelation.equal,
//                                                       toItem: view.scrollView,
//                                                       attribute: NSLayoutAttribute.top,
//                                                       multiplier: 1.0,
//                                                       constant: 10)
//            
//            view.scrollView.addConstraint(tagLabelTopConstraint)
//            
//            if tagLabelArray.count == 1 {
//                // タグ間の距離制約を5とする。
//                let tagLabelleadingConstraint = NSLayoutConstraint(item: tagLabel,
//                                                                   attribute: NSLayoutAttribute.leading,
//                                                                   relatedBy: NSLayoutRelation.equal,
//                                                                   toItem: view.scrollView,
//                                                                   attribute: NSLayoutAttribute.leading,
//                                                                   multiplier: 1.0,
//                                                                   constant: 1)
//                
//                view.scrollView.addConstraint(tagLabelleadingConstraint)
//            } else {
//                // タグ間の距離制約を5とする。
//                let tagLabelleadingConstraint = NSLayoutConstraint(item: tagLabel,
//                                                                   attribute: NSLayoutAttribute.leading,
//                                                                   relatedBy: NSLayoutRelation.equal,
//                                                                   toItem: tagLabelArray[tagLabelArray.count-1],
//                                                                   attribute: NSLayoutAttribute.trailing,
//                                                                   multiplier: 1.0,
//                                                                   constant: 5)
//                view.scrollView.addConstraint(tagLabelleadingConstraint)
//            }

        }
        
//        screenWidth = screenSize.width
//        // UIScrollViewのコンテンツサイズを画像のtotalサイズに合わせる
//        let nWidth:CGFloat = screenWidth * CGFloat(pageNum)
        print("heightは\(view.frame.height)")
        view.scrollView.contentSize = CGSize(width: widthTotal, height: Int(view.frame.height))
        
//        view.scrollView.contentSize = CGSize(width: widthTotal, height: 100)
        
    }
    
    
    // Screenの高さ
    var screenHeight:CGFloat!
    // Screenの幅
    var screenWidth:CGFloat!
    
    // Totalのページ数
    let pageNum:Int  = 3
    
    let screenSize: CGRect = UIScreen.main.bounds
    
    func setFavBrand2(view: ProfileView) {
        
        
        
        screenWidth = screenSize.width
        
        let imageTop:UIImage = UIImage(named:"ad1.png")!
        
        let imageWidth = imageTop.size.width
        let imageHeight = imageTop.size.height
        screenHeight = screenWidth * imageHeight/imageWidth
        
        
        print("pWidth: \(screenWidth)")
        
        for i in 0 ..< pageNum {
            let n:Int = i+1
            
            // UIImageViewのインスタンス
            let image:UIImage = UIImage(named:"ad\(n)")!
            let imageView = UIImageView(image:image)
            
            var rect:CGRect = imageView.frame
            rect.size.height = screenHeight
            rect.size.width = screenWidth
            imageView.frame = rect
            imageView.tag = n
            
            // UIScrollViewのインスタンスに画像を貼付ける
            view.scrollView.addSubview(imageView)
            
        }
        
        setupScrollImages(view: view)
    }
    
    func setupScrollImages(view: ProfileView){
        
        // ダミー画像
        let imageDummy:UIImage = UIImage(named:"ad1.png")!
        var imgView = UIImageView(image:imageDummy)
        var subviews:Array = view.scrollView.subviews
        
        // 描画開始の x,y 位置
        var px:CGFloat = 0.0
        let py:CGFloat = 100.0
        
        for i in 0 ..< subviews.count {
            imgView = subviews[i] as! UIImageView
            if (imgView.isKind(of: UIImageView.self) && imgView.tag > 0){
                
                var viewFrame:CGRect = imgView.frame
                viewFrame.origin = CGPoint(x: px, y: py)
                imgView.frame = viewFrame
                
                px += (screenWidth)
                
            }
        }
        // UIScrollViewのコンテンツサイズを画像のtotalサイズに合わせる
        let nWidth:CGFloat = screenWidth * CGFloat(pageNum)
        view.scrollView.contentSize = CGSize(width: nWidth, height: screenHeight)
        
    }

}
