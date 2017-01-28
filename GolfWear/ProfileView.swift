//
//  ProfileView.swift
//  GolfWear
//
//  Created by DaichiSaito on 2017/01/07.
//  Copyright © 2017年 DaichiSaito. All rights reserved.
//

import UIKit

class ProfileView: UIView {
    @IBOutlet weak var testView: UIView!

    @IBOutlet weak var scrollView: UIScrollView!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
//        self.commonInit()
    }
    
    // 追加
//    override func intrinsicContentSize() -> CGSize {
//        return CGSize(width: 210, height: 100)
//    }
    
    override public var intrinsicContentSize: CGSize {
        get {
            //...
            return CGSize(width: 210, height: 10)
        }
    }

}
