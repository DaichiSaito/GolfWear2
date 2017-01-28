//
//  CommonUtl.swift
//  NailApp_Refactoring
//
//  Created by DaichiSaito on 2016/06/18.
//  Copyright © 2016年 DaichiSaito. All rights reserved.
//

import UIKit

extension NSMutableData {
    func appendString(string: String) {
        let data = string.data(using: String.Encoding.utf8, allowLossyConversion: true)
        append(data!)
    }
}

class CommonUtl: NSObject {
    
    static func makeNavigationLabel(title: String) -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-LightItalic",size: CGFloat(15))
        label.textAlignment = NSTextAlignment.center//整列
        label.textColor = UIColor(red: 1.00, green: 0.20, blue: 0.83, alpha: 1)
        label.text = title
        label.sizeToFit()
        return label
    }
    
    /* 画像のリサイズ（こっちは未使用） */
//    static func resizeImage(image: UIImage, width: Int, height: Int) -> UIImage {
//        
//        let size: CGSize = CGSize(width: width, height: height)
//        UIGraphicsBeginImageContext(size)
//        image.drawInRect(CGRectMake(0, 0, size.width, size.height))
//        
//        let resizeImage = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        return resizeImage
//    }
    
    /* 画像のリサイズ */
    static func resizeImage(src: UIImage) -> UIImage {
        let maxLongSide:CGFloat = 10//414
        // リサイズが必要か？
        let ss = src.size
        if ( ss.width <= maxLongSide && ss.height <= maxLongSide ) {
            return src
        }
        
        // リサイズ後のサイズを計算
        let ax = ss.width / maxLongSide
        let ay = ss.height / maxLongSide
        let ar = ax > ay ? ax : ay
        let re = CGRect(x: 0, y: 0, width: ss.width / ar, height: ss.height / ar)
        
        // リサイズ
        UIGraphicsBeginImageContext(re.size)
        src.draw(in: re)
        let dst = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return dst!
    }
    
}
