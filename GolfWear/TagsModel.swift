//
//  BrandsModel.swift
//  GolfWear
//
//  Created by DaichiSaito on 2017/01/28.
//  Copyright © 2017年 DaichiSaito. All rights reserved.
//

import UIKit

class TagsModel: NSObject {
    dynamic var tags = [String]()
    class var sharedInstance : TagsModel {
        struct Singleton {
            static var instance = TagsModel()
        }
        return Singleton.instance
    }
    
}
