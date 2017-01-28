//
//  MyPageViewController.swift
//  GolfWear
//
//  Created by DaichiSaito on 2017/01/07.
//  Copyright © 2017年 DaichiSaito. All rights reserved.
//

import UIKit

class MyPageViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {

    @IBOutlet weak var collectionView: UICollectionView!
    let iconPicArray = ["mypage_profile.png","mypage_toukouichiran.png","mypage_coupon.png","ad3.png"]
    let adPicArray = ["ad1.png","ad2.png","ad3.png"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
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
        
        switch indexPath.section {
        case 0:
            let width: CGFloat = super.view.frame.width / 2 - 2
            let height: CGFloat = width
            
            return CGSize(width: width, height: height)
            
        case 1:
            
            let width: CGFloat = super.view.frame.width
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
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0,y: 0,width: cell.frame.size.width,height: cell.frame.size.height)
        if (indexPath.section == 0) {
            imageView.image = UIImage(named: iconPicArray[indexPath.row])
        } else if (indexPath.section == 1) {
            imageView.image = UIImage(named: adPicArray[indexPath.row])
        }
        
        cell.addSubview(imageView)
        return cell
    }
    
    // セルの数を返す
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 4
        case 1:
            return 3
        default:
            return 0
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    //セル選択時の呼び出しメソッド
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //セグエを実行する。
//        performSegue(withIdentifier: "TestSegue", sender: nil)
//        let indexPath = self.collectionView!.indexPathForCell(cell)
        
        switch indexPath.row {
        case 0:
            let controller = self.storyboard!.instantiateViewController( withIdentifier: "ProfileViewController" ) as! ProfileViewController
            self.navigationController?.pushViewController(controller, animated: true)
        case 1:
            let controller = self.storyboard!.instantiateViewController( withIdentifier: "ToukouIchiranViewController" ) as! ToukouIchiranViewController
            self.navigationController?.pushViewController(controller, animated: true)
        case 2:
            let controller = self.storyboard!.instantiateViewController( withIdentifier: "CouponIchiranViewController" ) as! CouponIchiranViewController
            self.navigationController?.pushViewController(controller, animated: true)
            
        default: break
            
        }
        
        
        
    }
}
