//
//  ModelBase.swift
//  GolfWear
//
//  Created by DaichiSaito on 2017/01/11.
//  Copyright © 2017年 DaichiSaito. All rights reserved.
//

class ModelBase: NSObject {
    
//    dynamic var condition: [Dictionary<String,AnyObject>] = [Dictionary<String,AnyObject>]()
//    dynamic var condition: Dictionary<String,AnyObject> = Dictionary<String,AnyObject>()
    dynamic var condition: Dictionary<String,AnyObject> = Dictionary<String,AnyObject>()
    
//    func get(row: Int) -> Dictionary<String,AnyObject> {
//        return self.list[row]
//    }
    func get() -> Dictionary<String,AnyObject> {
        return self.condition
    }
//
    func set(condition: Dictionary<String,AnyObject>) {
        self.condition = condition
    }
//
//    func getAll() -> [Dictionary<String,AnyObject>] {
//        return self.list
//    }
//    
//    func remove(row: Int) {
//        self.list.removeAtIndex(row)
//    }
//    
//    func add(data: Dictionary<String,AnyObject>) {
//        self.list.insert(data, atIndex: self.list.count)
//    }
}
