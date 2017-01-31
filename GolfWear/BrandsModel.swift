//
//  BrandsModel.swift
//  GolfWear
//
//  Created by DaichiSaito on 2017/01/28.
//  Copyright © 2017年 DaichiSaito. All rights reserved.
//

import UIKit

class BrandsModel: NSObject {
    var dataList = [
        "アイラインゴルフ":false,
        "アキュディス":false,
        "アキラプロダクツ":false,
        "朝日ゴルフ用品":false,
        "アサヒゴルフヨウヒン":false,
        "アシックス":false,
        "アシュワース":false,
        "AZROF":false,
        "アズロフ":false,
        "アダバット":false,
        "アダムス":false,
        "アックス":false,
        "アディダス":false,
        "アドバイザー":false,
        "アドミラル":false,
        "アミノバイタル":false,
        "アルインコ":false,
        "アルチビオ":false]
    var dataList2 = [
        "アイラインゴルフ",
        "アキュディス",
        "アキラプロダクツ",
        "朝日ゴルフ用品",
        "アサヒゴルフヨウヒン",
        "アシックス",
        "アシュワース",
        "AZROF",
        "アズロフ",
        "アダバット",
        "アダムス",
        "アックス",
        "アディダス",
        "アドバイザー",
        "アドミラル",
        "アミノバイタル",
        "アルインコ",
        "アルチビオ"]
    var dataList3 = [
        "アイラインゴルフ":false,
        "アキュディス":false,
        "アキラプロダクツ":false,
        "朝日ゴルフ用品":false,
        "アサヒゴルフヨウヒン":false,
        "アシックス":false,
        "アシュワース":false,
        "AZROF":false,
        "アズロフ":false,
        "アダバット":false,
        "アダムス":false,
        "アックス":false,
        "アディダス":false,
        "アドバイザー":false,
        "アドミラル":false,
        "アミノバイタル":false,
        "アルインコ":false,
        "アルチビオ":false]
    var selectedBrands = [String]()
    class var sharedInstance : BrandsModel {
        struct Singleton {
            static var instance = BrandsModel()
        }
        return Singleton.instance
    }

}
