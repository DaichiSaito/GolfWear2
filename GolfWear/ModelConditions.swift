//
//  ModelConditions.swift
//  GolfWear
//
//  Created by DaichiSaito on 2017/01/11.
//  Copyright © 2017年 DaichiSaito. All rights reserved.
//



class ModelConditions : ModelBase {
    
    enum CONDITION_KEY: String {
        case MODELINFO = "modelInfo"
        case SEX = "sex"
        case TALL = "tall"
        case AGE = "age"
        case COLORINFO = "colorInfo"
        case TOPS = "tops"
        case PANTS = "pants"
        case OUTER = "outer"
        case SHOSE = "shose"
        case HAT = "hat"
        case NECK = "neck"
        case OTHERITEM = "otheritem"
        case BRANDINFO = "brand"
        case BRANDITEMS = "branditems"
        case OTHERINFO = "other"
        case SEASON = "season"
//        case TALL: String = "tall"
//        case AGE: String = "age"
//        case COLOR: String = "colorInfo"
//        case TOPS: String = "tops"
//        case PANTS: String = "pants"
//        case OUTER: String = "outer"
//        case SHOSE: String = "shose"
//        case HAT: String = "hat"
//        case NECK: String = "neck"
//        case OTHERITEM: String = "otheritem"
//        case BRAND: String = "brand"
//        case OTHER: String = "other"

    }
    
    static var CONDITION_KEY_ARRAY = [
//        CONDITION_KEY.SEX,
//        CONDITION_KEY.TALL,
        CONDITION_KEY.SEASON,
        CONDITION_KEY.TOPS,
        CONDITION_KEY.PANTS,
        CONDITION_KEY.OUTER,
        CONDITION_KEY.SHOSE,
        CONDITION_KEY.HAT,
        CONDITION_KEY.NECK,
        CONDITION_KEY.OTHERITEM
    ]
//    static var conditionModel: Dictionary<String,AnyObject> = Dictionary<String,AnyObject>()
//    static var conditionColor: Dictionary<String,AnyObject> = Dictionary<String,AnyObject>()
//    static var conditionBrand: Dictionary<String,AnyObject> = Dictionary<String,AnyObject>()
//    static var conditionOther: Dictionary<String,AnyObject> = Dictionary<String,AnyObject>()
////    var conditionAll: Dictionary<String,AnyObject> = Dictionary<String,AnyObject>()
    
//    var conditionAll: Dictionary<String,Dictionary<String,AnyObject>> = [
//        CONDITION_KEY.MODELINFO.rawValue : conditionModel as Dictionary,
//        CONDITION_KEY.COLORINFO.rawValue : conditionColor as Dictionary,
//        CONDITION_KEY.BRANDINFO.rawValue : conditionBrand as Dictionary,
//        CONDITION_KEY.OTHERINFO.rawValue : conditionOther as Dictionary
//    ]
//    
    class var sharedInstance : ModelConditions {
        struct Singcaseon {
            static var instance = ModelConditions()
        }
        return Singcaseon.instance
    }
    
    func getCondition() {
//        Alamofire.manager
//            .request(.POST, "http://example.com/path/to", parameters: params)
//            .responseJSON { request, response, JSON, error in
//                var response =  Dictionary<String,AnyObject>()
//                if var parse = JSON as? Dictionary<String,AnyObject> {
//                    response = parse
//                }
//                if var list = response["data"] as? [Dictionary<String,AnyObject>] {
//                    for var i = 0; i < list.count; i++ {
//                        self.add(list[i])
//                    }
//                }
//        }
        // 本来はサーバ or UserDefaultから条件情報をとってくる。
        
//        (self.condition[CONDITION_KEY.MODELINFO] as! Dictionary)[CONDITION_KEY.SEX] = "1"
//        self.condition[""] = "1" as AnyObject?
//        conditionModel = 
        
        
//        conditionColor = conditionAll[CONDITION_KEY.COLORINFO.rawValue]
//        conditionBrand = conditionAll[CONDITION_KEY.BRANDINFO.rawValue]
//        conditionOther = conditionAll[CONDITION_KEY.OTHERINFO.rawValue]
        /* モデル情報 */
//        // 性別
//        ModelConditions.conditionModel[CONDITION_KEY.SEX.rawValue] = "MEN" as AnyObject?
//        // 身長
//        ModelConditions.conditionModel[CONDITION_KEY.TALL.rawValue] = "170" as AnyObject?
//        // 年齢
//        ModelConditions.conditionModel[CONDITION_KEY.AGE.rawValue] = "28" as AnyObject?
//        /* カラー情報 */
//        // トップス
//        ModelConditions.conditionColor[CONDITION_KEY.TOPS.rawValue] = UIColor.blue as AnyObject?
//        // パンツ
//        ModelConditions.conditionColor[CONDITION_KEY.PANTS.rawValue] = UIColor.blue as AnyObject?
//        // アウター
//        ModelConditions.conditionColor[CONDITION_KEY.OUTER.rawValue] = UIColor.blue as AnyObject?
//        // シューズ
//        ModelConditions.conditionColor[CONDITION_KEY.SHOSE.rawValue] = UIColor.blue as AnyObject?
//        // 帽子
//        ModelConditions.conditionColor[CONDITION_KEY.HAT.rawValue] = UIColor.blue as AnyObject?
//        // ネックウォーマー
//        ModelConditions.conditionColor[CONDITION_KEY.NECK.rawValue] = UIColor.blue as AnyObject?
//        // その他
//        ModelConditions.conditionColor[CONDITION_KEY.OTHERITEM.rawValue] = UIColor.blue as AnyObject?
//        /* ブランド情報 */
//        // ブランドn
//        
//        /* その他情報 */
//        // その他
//        conditionAll[CONDITION_KEY.MODELINFO.rawValue] = ModelConditions.conditionModel
//        conditionAll[CONDITION_KEY.COLORINFO.rawValue] = ModelConditions.conditionColor
//        conditionAll[CONDITION_KEY.BRANDINFO.rawValue] = ModelConditions.conditionBrand
//        conditionAll[CONDITION_KEY.OTHERINFO.rawValue] = ModelConditions.conditionOther
        
        
//        self.condition = self.conditionAll as Dictionary<String, AnyObject>
//        self.condition = [
//            CONDITION_KEY.SEX.rawValue: "MEN"
//        ]
    }
}

