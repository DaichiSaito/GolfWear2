//
//  ViewController.swift
//  GolfWear
//
//  Created by DaichiSaito on 2016/12/25.
//  Copyright © 2016年 DaichiSaito. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MDCSwipeToChooseDelegate, UINavigationControllerDelegate{
    dynamic var imageInfo = [] as NSArray
    fileprivate var frontCardView: MDCSwipeToChooseView?
    fileprivate var backCardView: MDCSwipeToChooseView?
    fileprivate var currentIndex: Int = 0
    
    @IBInspectable var horizontalMargin: CGFloat = 16.0
    @IBInspectable var topMargin: CGFloat = 50.0
    @IBInspectable var backViewBottomValue: CGFloat = 10.0
    @IBInspectable var ratio: CGFloat = 1.25
    
    
    
    func clickSearchButton(){
        //searchButtonを押した際の処理を記述
//        let controller = self.storyboard!.instantiateViewController( withIdentifier: "SearchConditionViewController" ) as! SearchConditionViewController
        let controller = self.storyboard!.instantiateViewController( withIdentifier: "SearchViewController" ) as! SearchViewController
        self.navigationController?.pushViewController(controller, animated: true)
//        self.present(controller, animated: true, completion: nil)
        
        
    }
    
    func clickRefreshButton(){
        //refreshButtonを押した際の処理を記述
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addObserver(self, forKeyPath: "imageInfo", options: [.new, .old], context: nil)
        self.loadImageData()
//        setupView()
        // Do any additional setup after loading the view, typically from a nib.
        
        // ボタン作成
        // barButtonSystemItemを変更すればいろいろなアイコンに変更できます
        let searchButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.search, target: self, action: #selector(ViewController.clickSearchButton))
//        let refreshButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.refresh, target: self, action: #selector(ViewController.clickRefreshButton))
        
        //ナビゲーションバーの右側にボタン付与
        self.navigationItem.setLeftBarButtonItems([searchButton], animated: true)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        NSLog("Called:" + keyPath!)
        if (keyPath == "imageInfo") {
            self.setupView()
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func setupView() {
        
        if let frontCardView = popCardViewWithFrame(frontCardViewFrame(), index: currentIndex) {
            view.addSubview(frontCardView)
            setFrontView(frontCardView, index: currentIndex)
        }
        
        if let backCardView = popCardViewWithFrame(backCardViewFrame(), index: nextIndex()), let frontView = frontCardView {
            self.backCardView = backCardView
            view.insertSubview(backCardView, belowSubview: frontView)
        }
    }
    fileprivate func frontCardViewFrame() -> CGRect {
        let viewWidth = view.frame.width
        let width = viewWidth - (horizontalMargin * 2)
        let height = viewWidth * ratio
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        return CGRect(x: horizontalMargin, y: statusBarHeight + topMargin, width: width, height: height)
    }
    
    fileprivate func backCardViewFrame() -> CGRect {
        let frame = frontCardViewFrame()
        return CGRect(origin: CGPoint(x: frame.origin.x, y: frame.origin.y + backViewBottomValue), size: frame.size)
    }
    
    /* 画像取得処理
     onSpanとかも設定
     imageNames配列から画像名も取得
     ContentsViewのインスタンスを生成し、それを返却
     */
    fileprivate func popCardViewWithFrame(_ frame: CGRect, index: Int) -> MDCSwipeToChooseView? {
        
        let options: MDCSwipeToChooseViewOptions = MDCSwipeToChooseViewOptions()
        options.delegate = self
        //        options.likedText = "LIKE!"
        //        options.likedColor = UIColor(red: 0.18, green: 0.8, blue: 0.44, alpha: 0.8)
        //        options.nopeText = "Hummm...."
        //        options.nopeColor = UIColor(red: 0.9, green: 0.3, blue: 0.25, alpha: 1.0)
        // swipeしたときに動く関数っぽい。
        options.onPan = {[weak self] state -> Void in
            if let weakSelf = self, let backView = self?.backCardView {
                let frame = weakSelf.frontCardViewFrame()
                let y = frame.origin.y - ((state?.thresholdRatio)! * weakSelf.backViewBottomValue)
                backView.frame = CGRect(x: frame.origin.x, y: y, width: frame.width, height: frame.height)
            }
        }
        
//        let imageURL = imageInfo[index].objectForKey("url") as? String
//        let imageURL = NSURL(string: imageInfo[index].objectForKey("url") as! String)
        // var view = MDCSwipeToChooseView(frame: self.view.bounds, options: options)
        // ほんとは上のような感じでやればOKらしいが、このフレームワークではContentsViewをかませてる。
        let url = URL(string: (imageInfo[index] as AnyObject).object(forKey: "imagePath") as! String)
        let req = URLRequest(url:url!)
        let view = MDCSwipeToChooseView(frame: frame, options: options)
//        let imageView2 = UIImageView()
//        let placeholder = UIImage(named: "transparent.png")
//        imageView2.setImageWithURL(url, placeholderImage: placeholder)
//        view.imageView.setImageWithURL(url, placeholderImage: placeholder)
        NSURLConnection.sendAsynchronousRequest(req, queue:OperationQueue.main){(res, data, err) in
            let image = UIImage(data:data!)
            // 画像に対する処理 (UcellのUIImageViewに表示する等)
            view?.imageView.image = image
        }
        return view
    }
    
    fileprivate func nextIndex() -> Int {
        let i = currentIndex + 1
        if i >= imageInfo.count {
            return 0
        }
        return i
    }
    /* 前面ビューの設定
     前面ビューのメンバ変数に引数で渡されたviewを設定
     さらにバックグラウンドビューにもそのviewを設定
     */
    fileprivate func setFrontView(_ view: MDCSwipeToChooseView, index: Int) {
        self.frontCardView = view
        self.currentIndex = index
        
//        let transitionAnim = CATransition()
//        transitionAnim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
//        transitionAnim.type = kCATransitionFade
//        transitionAnim.duration = 0.5
//        self.backgroundImageView.layer.addAnimation(transitionAnim, forKey: "transition")
//        self.backgroundImageView.image = view.mainImageView.image
    }
    
    func view(_ view: UIView!, wasChosenWith direction: MDCSwipeDirection) {
        
        if let backView = backCardView {
            setFrontView(backView, index: nextIndex())
            self.backCardView = popCardViewWithFrame(backCardViewFrame(), index: nextIndex())
        }
        
        if let backView = backCardView, let frontView = frontCardView {
            backView.alpha = 0
            self.view.insertSubview(backView, belowSubview: frontView)
            UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions(), animations: {[weak self] () -> Void in
                self?.backCardView?.alpha = 1
                }, completion: nil)
        }
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
    
    override func viewDidAppear(_ animated: Bool) {
        let tutorial = TutorialViewController();
        if (tutorial.isTutorialDone()){
            tutorial.pageImagesArr = ["tutorial_page_1.png","tutorial_page_2.png","tutorial_page_3.png"];
            self.present(tutorial, animated: true, completion: nil)
        }
    }


}

