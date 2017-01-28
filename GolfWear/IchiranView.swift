//
//  IchiranView.swift
//  GolfWear
//
//  Created by DaichiSaito on 2017/01/06.
//  Copyright © 2017年 DaichiSaito. All rights reserved.
//

import UIKit

class IchiranView: UIView {

    @IBOutlet weak var collectionView: UICollectionView!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
